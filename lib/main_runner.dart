import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/logger/bloc_observer.dart';
import 'package:zakazflow/core/logger/logger.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

typedef AppBuilder = Widget Function();

mixin MainRunner {
  static Future<Widget> _initApp(AppBuilder app) async {
    return app();
  }

  static Future<void> run({required AppBuilder appBuilder}) async {
    runZonedGuarded<void>(
      () => Logger.runLogging(
        () async {
          await initUI();
          // await initFirebase();
          await initBloc();
          await configureDependencies();

          final app = await _initApp(appBuilder);
          runApp(app);
        },
      ),
      Logger.logZoneError,
    );
  }

  static Future<void> initUI() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
    );
  }

  // static Future<void> initFirebase() async {
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);
  //   await FirebaseCrashlytics.instance
  //       .setCrashlyticsCollectionEnabled(kReleaseMode);
  //   FlutterError.onError = Logger.logFlutterError;
  // }

  static Future<void> initBloc() async {
    Bloc.observer = AppBlocObserver();
    Bloc.transformer = bloc_concurrency.sequential<Object?>();
  }
}

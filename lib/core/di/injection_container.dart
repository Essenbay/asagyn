import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakazflow/core/di/injection_container.config.dart';
import 'package:zakazflow/core/router/app_router.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init',
    preferRelativeImports: true,
    asExtension: true,
    ignoreUnregisteredTypes: [
      FlutterSecureStorage,
      Dio,
      SharedPreferences,
      AppRouter,
      PusherChannelsFlutter
    ])
Future<void> configureDependencies() async {
  const securedStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));
  getIt.registerLazySingleton<FlutterSecureStorage>(() => securedStorage);
  final dio = Dio();
  getIt.registerLazySingleton<Dio>(() => dio);
  final pref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => pref);
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<PusherChannelsFlutter>(
      () => PusherChannelsFlutter());
  getIt.init();
}

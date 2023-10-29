import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zakazflow/core/services/app_status/app_bloc.dart';

@RoutePage()
class LauncherScreen extends StatefulWidget {
  const LauncherScreen({super.key});

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    context.read<AppBloc>().add(const AppEvent.checkAuth());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) async {
        switch (state) {
          case AppState.launching:
            break;
          case AppState.authenticated:
            FlutterNativeSplash.remove();
            await context.router.pushAndPopUntil(const MainRoute(),
                predicate: ModalRoute.withName('/'));
            break;
          case AppState.unauthenticated:
            FlutterNativeSplash.remove();
            await context.router.pushAndPopUntil(const LoginRoute(),
                predicate: ModalRoute.withName('/'));
            break;
        }
      },
      child: Scaffold(),
    );
  }
}

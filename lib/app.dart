import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/config/themes.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/core/services/language_provder/language_cubit.dart';

class ZakazFlowApp extends StatelessWidget {
  ZakazFlowApp({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    final langauge = context.watch<LanguageCubit>().state;
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.grey.withOpacity(0.5),
      overlayWidget: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          padding: const EdgeInsets.all(10),
          child: Platform.isAndroid
              ? const CircularProgressIndicator(color: AppColors.primary)
              : const CupertinoActivityIndicator(
                  color: AppColors.primary,
                ),
        ),
      ),
      child: MaterialApp.router(
        title: 'AsAgyn',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: langauge.locale,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: Colors.white,
      primaryTextTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Montserrat',
          bodyColor: AppColors.black,
          displayColor: AppColors.black),
      textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Montserrat',
          bodyColor: AppColors.black,
          displayColor: AppColors.black),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.primary,
        backgroundColor: AppColors.white,
      ),
      
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.primary),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
      splashColor: AppColors.primary200,
      expansionTileTheme: const ExpansionTileThemeData(
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.primary,
          childrenPadding: EdgeInsets.symmetric(
            horizontal: 16,
          )),
      cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(fontFamily: 'Montserrat'),
        primaryColor: AppColors.primary,
      )),
      unselectedWidgetColor: AppColors.primary300,
      dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(color: AppColors.black),
          contentTextStyle: TextStyle(color: AppColors.black)));
}

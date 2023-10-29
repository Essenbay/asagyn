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
      colorScheme: const ColorScheme.light(
        background: AppColors.white,
        primary: AppColors.primary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
      ),
      iconTheme: IconThemeData(color: AppColors.primary),
      splashColor: AppColors.primary200,
      expansionTileTheme: ExpansionTileThemeData(
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.primary,
          childrenPadding: EdgeInsets.symmetric(
            horizontal: 16,
          )),
      cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(fontFamily: 'Montserrat'))),
      unselectedWidgetColor: AppColors.primary300,
      dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(color: AppColors.black),
          contentTextStyle: TextStyle(color: AppColors.black)));
}

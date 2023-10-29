import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;

  ThemeData get theme => Theme.of(this);

  AppLocalizations get localized => AppLocalizations.of(this)!;

  ScreenSize get screenSizeType => getSize(this);
}

enum ScreenSize { small, normal, large, extraLarge }

ScreenSize getSize(BuildContext context) {
  final deviceSize = MediaQuery.of(context).size;
  final double diagonalInches =
      sqrt(pow(deviceSize.width, 2) + pow(deviceSize.height, 2)) / 160.0;
  if (deviceSize.width < 350) return ScreenSize.small;
  if (diagonalInches > 8.5) return ScreenSize.extraLarge;
  if (diagonalInches >= 7.5) return ScreenSize.large;
  return ScreenSize.normal;
}

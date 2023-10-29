import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class TitledAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final Widget? actionWidget;
  final Color foreground;
  const TitledAppBar(
      {super.key,
      this.elevation = 0,
      required this.titleText,
      this.actionWidget,
      this.foreground = AppColors.primary});
  final double elevation;
  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: elevation,
        title: Text(
          titleText,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: foreground),
        ),
        centerTitle: false,
        actions: [actionWidget ?? const SizedBox()]);
  }
}

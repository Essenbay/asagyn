import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zakazflow/core/config/colors.dart';

class BackIconLeadingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final IconData icon;
  final List<Widget>? actions;
  final String? leadingText;
  final Color? foregroundColor;
  final String? title;
  const BackIconLeadingAppBar(
      {super.key,
      this.actions,
      required this.icon,
      this.elevation = 0,
      this.leadingText,
      this.foregroundColor = AppColors.primary,
      this.title,
      this.leadingPadding = 16,
      this.systemUiOverlayStyle});
  final double elevation;
  final double leadingPadding;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension);

  @override
  Widget build(BuildContext context) {
    void onPressed() => context.router.removeLast();
    final Widget iconWidget = Icon(
      icon,
      color: foregroundColor,
      size: 26,
    );
    final Widget leading = leadingText == null
        ? iconWidget
        : Row(
            children: [
              iconWidget,
              Text(
                leadingText!,
                style: TextStyle(color: foregroundColor, fontSize: 16),
              )
            ],
          );
    return AppBar(
        elevation: elevation,
        systemOverlayStyle: systemUiOverlayStyle,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: CupertinoButton(
            alignment: Alignment.center,
            onPressed: onPressed,
            padding: EdgeInsets.symmetric(horizontal: leadingPadding),
            child: leading,
          ),
        ),
        leadingWidth: 110,
        title: Text(
          title ?? '',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: foregroundColor),
        ),
        centerTitle: true,
        actions: [...?actions, const SizedBox(width: 8)]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

@deprecated
class IconedDivider extends StatelessWidget {
  const IconedDivider(
      {super.key, required this.isExpanded, required this.toggle});
  final bool isExpanded;
  final void Function() toggle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.primary,
              height: 20,
              thickness: 1.5,
            ),
          ),
          Icon(
            isExpanded
                ? CupertinoIcons.chevron_compact_up
                : CupertinoIcons.chevron_compact_down,
            size: 28,
          ),
          const Expanded(
            child: Divider(
              color: AppColors.primary,
              height: 20,
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

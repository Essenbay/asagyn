// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zakazflow/core/config/colors.dart';

class MenuTile extends StatelessWidget {
  const MenuTile(
      {super.key,
      this.icon,
      this.showArrow = true,
      required this.text,
      this.subText,
      this.titleWeigh = FontWeight.w500,
      required this.onClick});
  final String? icon;
  final String text;
  final FontWeight titleWeigh;
  final String? subText;
  final VoidCallback? onClick;
  final bool showArrow;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (icon != null)
                    SvgPicture.asset(
                      icon!,
                      color: AppColors.primary,
                      height: 22,
                    ),
                  if (icon != null) const SizedBox(width: 15),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            fontWeight: titleWeigh,
                            fontSize: 15,
                          ),
                        ),
                        if (subText != null)
                          Text(subText ?? '',
                              style: const TextStyle(fontSize: 14)),
                      ]),
                ],
              ),
              showArrow
                  ? IconButton(
                      onPressed: onClick,
                      icon: const Icon(
                        CupertinoIcons.chevron_right,
                        size: 22,
                        color: AppColors.primary,
                      ))
                  : const SizedBox(height: 48, width: 1),
            ],
          ),
        ),
      ),
    );
  }
}

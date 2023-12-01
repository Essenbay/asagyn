import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(
      {super.key,
      required this.text,
      required this.isVisible,
      this.isLight = true,
      this.bottomWidget});

  final String? text;
  final bool isVisible;
  final bool isLight;
  final Widget? bottomWidget;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.red300,
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Icon(
                CupertinoIcons.exclamationmark_triangle,
                color: isLight ? AppColors.white : AppColors.red300,
              ),
              title: Text(
                text ?? context.localized.default_error,
                style: TextStyle(
                    color: isLight ? AppColors.white : AppColors.red300,
                    fontSize: 14),
              ),
            ),
          ),
          bottomWidget ?? const SizedBox()
        ],
      ),
    );
  }
}

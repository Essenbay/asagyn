import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class PrimaryFilledTextButton extends StatelessWidget {
  const PrimaryFilledTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isLoading = false,
      this.isLight = false,
      this.fontWeight = FontWeight.w600,
      this.borderRadius = 10,
      this.border,
      this.addShadow = false,
      this.height = 50,
      this.fontSize = 16,
      this.backgroundColor = AppColors.primary});
  final VoidCallback onPressed;
  final String text;
  final bool isLight;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final double borderRadius;
  final BoxBorder? border;
  final double height;
  final double fontSize;
  final bool addShadow;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: addShadow
          ? const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary200,
                  blurRadius: 6.0,
                  offset: Offset(0, 3),
                ),
              ],
            )
          : null,
      child: CupertinoButton(
        pressedOpacity: 0.4,
        minSize: 33,
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(borderRadius),
        color: isLight ? AppColors.white : backgroundColor,
        child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
          ),
          child: isLoading
              ? CircularProgressIndicator(
                  color: isLight ? AppColors.primary : AppColors.white,
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: isLight ? AppColors.primary : AppColors.white,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:zakazflow/core/config/colors.dart';

class PrimaryFilledTextButton extends StatelessWidget {
  const PrimaryFilledTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isLight = false,
      this.fontWeight = FontWeight.w600,
      this.borderRadius = 10,
      this.border,
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

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
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
        child: Text(
          text,
          style: TextStyle(
            color: isLight ? AppColors.primary : AppColors.white,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

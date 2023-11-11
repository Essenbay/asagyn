import 'package:flutter/cupertino.dart';
import 'package:zakazflow/core/config/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.prefix,
      this.keyboardType,
      this.suffix,
      this.hintText,
      this.maxLines = 1,
      this.padding,
      this.textAlign = TextAlign.start,
      this.textColor = AppColors.black});
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final int maxLines;
  final Color textColor;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;
  final Widget? suffix;
  final Widget? prefix;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      maxLines: maxLines,
      suffix: suffix,
      prefix: prefix,
      keyboardType: keyboardType,
      placeholder: hintText,
      textAlign: textAlign,
      placeholderStyle: const TextStyle(
        color: AppColors.grey,
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      style: TextStyle(color: textColor, fontSize: 16),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primary)),
    );
  }
}

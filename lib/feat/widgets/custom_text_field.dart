import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.obscureText = false,
    this.maxLines = 1,
    this.padding,
    this.textAlign = TextAlign.start,
    this.textColor = AppColors.black,
    this.labelText,
    this.suffix,
    this.prefix,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final int maxLines;
  final Color textColor;
  final bool obscureText;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;
  final Widget? suffix;
  final Widget? prefix;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.black300,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(color: AppColors.black300, fontSize: 20),
        labelText: labelText,
        contentPadding:
            padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.grey400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        suffixIcon: suffix,
        prefixIcon: prefix,
      ),
      textAlign: textAlign,
      style: TextStyle(color: textColor, fontSize: 16),
    );
  }
}

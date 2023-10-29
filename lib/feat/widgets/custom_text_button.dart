import 'package:flutter/cupertino.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.style,
      this.padding});
  final VoidCallback onTap;
  final String text;
  final TextStyle? style;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      borderRadius: BorderRadius.circular(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ).merge(style),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 0)});
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
      padding: padding,
    );
  }
}

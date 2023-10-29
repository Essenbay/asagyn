import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';

class DisableablePrimaryButton extends StatefulWidget {
  final void Function() onPressed;
  final String title;
  final TextStyle? textStyle;
  final Color color;
  final double? radius;
  final bool isEnabled;
  final double height;
  const DisableablePrimaryButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.textStyle,
      this.height = 60,
      this.color = AppColors.primary,
      this.radius,
      this.isEnabled = true})
      : super(key: key);

  @override
  State<DisableablePrimaryButton> createState() =>
      _DisableablePrimaryButtonState();
}

class _DisableablePrimaryButtonState extends State<DisableablePrimaryButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final animation = ColorTween(
          begin: widget.isEnabled ? widget.color : Colors.grey,
          end: widget.isEnabled ? Colors.grey : widget.color)
      .animate(_controller);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DisableablePrimaryButton oldWidget) {
    if (oldWidget.isEnabled != widget.isEnabled) {
      if (widget.isEnabled) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AnimatedBuilder(
          animation: animation,
          child: Text(
            widget.title,
            style: widget.textStyle ??
                context.theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontSize: 18,
                ),
          ),
          builder: (context, child) {
            return CupertinoButton(
              pressedOpacity: widget.isEnabled ? 0.4 : 1,
              onPressed: () => widget.isEnabled ? widget.onPressed() : null,
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(10),
              color: widget.isEnabled ? widget.color : AppColors.grey,
              child: Container(
                height: widget.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.title,
                  style: widget.textStyle,
                ),
              ),
            );
          }),
    );
  }
}

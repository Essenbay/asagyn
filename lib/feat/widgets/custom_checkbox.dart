import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox(
      {super.key, required this.value, required this.onChange});
  final bool value;
  final ValueChanged<bool> onChange;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _sizeAnimation = Tween<double>(begin: 0, end: 12).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: AppColors.primary,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChange(!widget.value);
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 1,
            color: const Color(0xFFd4d4d4).withOpacity(1),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Visibility(
                visible: widget.value || _animationController.isAnimating,
                child: Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  decoration: BoxDecoration(
                    color: _colorAnimation.value,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

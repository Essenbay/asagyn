import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zakazflow/core/config/colors.dart';

class BottomNavAnimated extends StatefulWidget {
  const BottomNavAnimated(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.icon});

  final int value;
  final int groupValue;
  final String icon;

  @override
  State<BottomNavAnimated> createState() => _BottomNavAnimatedState();
}

class _BottomNavAnimatedState extends State<BottomNavAnimated>
    with TickerProviderStateMixin {
  late final AnimationController _settingController;
  @override
  void initState() {
    _settingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BottomNavAnimated oldWidget) {
    if (widget.value == widget.groupValue &&
        widget.groupValue != oldWidget.groupValue) {
      _settingController.reset();
      _settingController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _settingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          widget.groupValue == widget.value
              ? AppColors.primary400
              : AppColors.grey400,
          BlendMode.srcIn,
        ),
        child: Lottie.asset(
          widget.icon,
          controller: _settingController,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}

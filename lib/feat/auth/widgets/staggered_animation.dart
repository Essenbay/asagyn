import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomStaggeredAnimated extends StatelessWidget {
  const CustomStaggeredAnimated({required this.position, required this.child});
  final int position;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      duration: const Duration(milliseconds: 500),
      position: position,
      child: SlideAnimation(
        child: child,
        delay: const Duration(milliseconds: 150),
        horizontalOffset: 20,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';

class FlowingLinesWidget extends StatefulWidget {
  final int activeValue;
  final int oldValue;
  const FlowingLinesWidget(
      {super.key, required this.activeValue, required this.oldValue});

  @override
  _FlowingLinesWidgetState createState() => _FlowingLinesWidgetState();
}

class _FlowingLinesWidgetState extends State<FlowingLinesWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void didUpdateWidget(covariant FlowingLinesWidget oldWidget) {
    if (widget.activeValue != widget.oldValue &&
        widget.activeValue > widget.oldValue) {
      _controller.reset();
      _controller.forward();
    } else if (widget.activeValue != widget.oldValue &&
        widget.activeValue < widget.oldValue) {
      _controller.value = 1;
      _controller.reverse();
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
    return Container(
      padding: EdgeInsets.only(
          left: context.screenSize.width *
              (((widget.activeValue == 1 && widget.oldValue == 2) ||
                      (widget.activeValue == 2 && widget.oldValue == 1))
                  ? .5
                  : .14)),
      width: context.screenSize.width,
      child: Container(
        width: context.screenSize.width / 3,
        child: CustomPaint(
          painter: FlowingLinesPainter(
              _controller, widget.oldValue, widget.activeValue),
          size: Size(context.screenSize.width / 3, 40),
        ),
      ),
    );
  }
}

class FlowingLinesPainter extends CustomPainter {
  final Animation<double> _animation;
  final int fromIndex;
  final int toIndex;

  FlowingLinesPainter(this._animation, this.fromIndex, this.toIndex)
      : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = _animation.value == 0 || _animation.value == 1
          ? Colors.transparent
          : AppColors.primary
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;
    final height = size.height / 5;

    final start = getFirstStart(_animation.value, size.width / 2.3);

    final lineEnd = size.width / 2.3 * _animation.value;

    // print('$start $lineEnd');

    canvas.drawLine(Offset(start, height), Offset(lineEnd, height), paint);
    canvas.drawLine(Offset(start + 10, height + 10),
        Offset(lineEnd + 10, height + 10), paint);
  }

  double getFirstStart(double value, double maxLen) {
    final len = maxLen - maxLen / 2;
    return len * value * (value * 2);
  }

  double getSecondStart(double value, double maxLen) {
    final len = maxLen * .3;
    return len * value * (value * 2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

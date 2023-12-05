import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class TestPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 3.0;
    final path = Path();
    path.moveTo(size.width / 2, size.height / 3);
    path.lineTo(80, 400);
    path.lineTo(size.width - 80, 400);
    path.lineTo(size.width - 80, size.height / 3);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

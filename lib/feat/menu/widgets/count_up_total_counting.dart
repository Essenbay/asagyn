import 'package:countup/countup.dart';
import 'package:flutter/material.dart';

class CountUpTotal extends StatefulWidget {
  final double total;
  const CountUpTotal({super.key, required this.total});
  @override
  _CountUpTotalState createState() => _CountUpTotalState();
}

class _CountUpTotalState extends State<CountUpTotal> {
  late double oldValue = widget.total;

  @override
  void didUpdateWidget(covariant CountUpTotal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.total != oldWidget.total) {
      oldValue = oldWidget.total;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Countup(
      begin: oldValue,
      end: widget.total,
      duration: const Duration(milliseconds: 100),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      suffix: ' ₸',
    );
  }

  final style = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

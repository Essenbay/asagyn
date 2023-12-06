import 'package:flutter/material.dart';

class CountUpTotal extends StatefulWidget {
  final double total;

  const CountUpTotal({Key? key, required this.total}) : super(key: key);

  @override
  State<CountUpTotal> createState() => _CountUpTotalState();
}

class _CountUpTotalState extends State<CountUpTotal> {
  late double prevTotal;
  @override
  void initState() {
    prevTotal = widget.total;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CountUpTotal oldWidget) {
    if (oldWidget.total != widget.total) {
      setState(() {
        prevTotal = widget.total;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        final position = Tween<Offset>(
                begin: prevTotal < widget.total
                    ? const Offset(0, -.5)
                    : const Offset(0, .5),
                end: Offset.zero)
            .animate(animation);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: position,
            child: child,
          ),
        );
      },
      child: Text(
        '${widget.total} ₸',
        key: ValueKey(widget.total),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

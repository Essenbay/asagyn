import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class CounterView extends StatefulWidget {
  final int initNumber;
  final void Function(int) counterCallback;
  final void Function()? increaseCallback;
  final void Function()? decreaseCallback;
  final int minNumber;

  CounterView(
      {this.initNumber = 0,
      required this.counterCallback,
      this.increaseCallback,
      this.decreaseCallback,
      this.minNumber = 0});
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late int _currentCount = widget.initNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primary400.withOpacity(0.3),
            spreadRadius: 1.0,
            blurRadius: 10.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: AppColors.grey100,
      ),
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: _createIncrementDicrementButton(
                CupertinoIcons.minus, () => _dicrement()),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  _currentCount.toString(),
                  style: TextStyle(fontSize: 16),
                )),
          ),
          Expanded(
            child: _createIncrementDicrementButton(
                CupertinoIcons.plus, () => _increment()),
          ),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
      widget.counterCallback(_currentCount);
      if (widget.increaseCallback != null) widget.increaseCallback!();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > widget.minNumber) {
        _currentCount--;
        widget.counterCallback(_currentCount);
        if (widget.decreaseCallback != null) widget.decreaseCallback!();
      }
    });
  }

  Widget _createIncrementDicrementButton(
      IconData icon, void Function() onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: 32.0, minHeight: 32.0),
      onPressed: onPressed,
      elevation: 0.0,
      fillColor: AppColors.grey200,
      child: Icon(
        icon,
        color: AppColors.black,
        size: 12.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

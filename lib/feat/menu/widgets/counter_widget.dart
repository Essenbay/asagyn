import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class CounterView extends StatelessWidget {
  final int value;
  final void Function(int) counterCallback;
  final void Function()? increaseCallback;
  final void Function()? decreaseCallback;
  final int minNumber;
  final bool isHorizontal;

  CounterView(
      {
      required this.counterCallback,
      this.isHorizontal = true,
      this.increaseCallback,
      this.decreaseCallback,
      this.minNumber = 0, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHorizontal ? 120 : null,
      height: isHorizontal ? null : 120,
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
      child: isHorizontal ? Row(
        children: children,
      ) : Column(
        children: children,
      ),
    );
  }

   List<Widget> get children => [Expanded(
            child: _createIncrementDicrementButton(
                CupertinoIcons.minus, () => _dicrement()),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  value.toString(),
                  style: TextStyle(fontSize: 16),
                )),
          ),
          Expanded(
            child: _createIncrementDicrementButton(
                CupertinoIcons.plus, () => _increment()),
          ),];

  void _increment() {
    counterCallback(value + 1);
      if (increaseCallback != null) increaseCallback!();
  }

  void _dicrement() {
    if (value > minNumber) {
        counterCallback(value - 1);
        if (decreaseCallback != null) decreaseCallback!();
      }
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

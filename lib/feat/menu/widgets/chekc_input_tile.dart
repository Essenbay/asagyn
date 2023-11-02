import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class CheckInput extends StatelessWidget {
  const CheckInput({super.key, required this.value, required this.onChange});
  final bool value;
  final ValueChanged<bool> onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(color: AppColors.primary)),
              checkColor: AppColors.primary,
              fillColor: MaterialStateProperty.all<Color>(Colors.white),
              value: value,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              onChanged: (_) => onChange(!value)),
          Text(
            'Подать напитки сразу',
            style: const TextStyle(),
          ),
        ],
      ),
    );
  }
}

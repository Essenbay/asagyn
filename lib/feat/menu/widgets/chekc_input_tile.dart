import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';

class CheckInput extends StatelessWidget {
  const CheckInput({super.key, required this.value, required this.onChange});
  final bool value;
  final ValueChanged<bool> onChange;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onChange(!value),
      child: Padding(
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
              context.localized.give_drinks_imm,
              style: const TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}

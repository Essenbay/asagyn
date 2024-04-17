import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';

enum SortValue {
  name,
  cheapFirst,
  expensiveFirst,
}

class SortButton extends StatelessWidget {
  const SortButton({super.key, required this.onSelected});
  final ValueChanged<SortValue> onSelected;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortValue>(
        surfaceTintColor: AppColors.white,
        onSelected: onSelected,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
        icon: SizedBox(
          height: 55,
          width: 55,
          child: InkWell(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: const Icon(Icons.sort),
            ),
          ),
        ),
        itemBuilder: (context) => [
              PopupMenuItem<SortValue>(
                value: SortValue.name,
                child: Text(context.localized.by_name),
              ),
              PopupMenuItem<SortValue>(
                value: SortValue.cheapFirst,
                child: Text(context.localized.cheap_first),
              ),
              PopupMenuItem<SortValue>(
                value: SortValue.expensiveFirst,
                child: Text(context.localized.expensive_first),
              ),
            ]);
  }
}

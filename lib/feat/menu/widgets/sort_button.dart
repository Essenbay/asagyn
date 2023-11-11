import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

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
        onSelected: onSelected,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
        icon: SizedBox(
          height: 55,
          width: 55,
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: Icon(Icons.sort),
            ),
          ),
        ),
        itemBuilder: (context) => [
              PopupMenuItem<SortValue>(
                value: SortValue.name,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('По названию'),
                ),
              ),
              PopupMenuItem<SortValue>(
                value: SortValue.cheapFirst,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Сначало дешевые'),
                ),
              ),
              PopupMenuItem<SortValue>(
                value: SortValue.expensiveFirst,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Сначало дорогие'),
                ),
              ),
            ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';

class SessionPopupMenuButton extends StatelessWidget {
  const SessionPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 55,
      child: PopupMenuButton(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          icon: SizedBox(
            height: 55,
            width: 55,
            child: InkWell(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: const Icon(Icons.more_vert),
              ),
            ),
          ),
          itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(CupertinoIcons.bell_circle_fill,
                          color: AppColors.primary),
                      title: Text(context.localized.call_waiter),
                      onTap: () {},
                    ),
                  ),
                ),
              ]),
    );
  }
}

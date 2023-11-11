import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class NotificationPopupButton extends StatelessWidget {
  const NotificationPopupButton({Key? key});

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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: Icon(CupertinoIcons.bell),
              ),
            ),
          ),
          itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 1,
                  child: ListTile(
                    leading: Icon(Icons.pending_actions_sharp),
                    title: Text('Заказ создан'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: ListTile(
                    leading: Icon(Icons.room_service),
                    title: Text('Заказ подан'),
                    onTap: () {
                      // Handle notification 2 tap
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ]),
    );
  }
}

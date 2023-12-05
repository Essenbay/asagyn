import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

class SessionPopupMenuButton extends StatelessWidget {
  const SessionPopupMenuButton({super.key, required this.model});
  final SessionModel model;
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
                      leading: const Icon(CupertinoIcons.bell_circle,
                          color: AppColors.primary),
                      title: Text(context.localized.call_waiter),
                      onTap: () {},
                    ),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(CupertinoIcons.share,
                          color: AppColors.primary),
                      title: Text(context.localized.share),
                      onTap: () {
                        //CONSIDER: Add deeplink?
                        //CONSIDER: Let user end session if no orders were created
                        Share.share(
                          context.localized.share_message(
                              model.establishmentCode,
                              model.establishmentName,
                              model.tableCode),
                          subject: context.localized.share_message(
                              model.establishmentCode,
                              model.establishmentName,
                              model.tableCode),
                        );
                      },
                    ),
                  ),
                ),
              ]),
    );
  }
}

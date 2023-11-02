import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/profilemenu/widgets/menu_tile.dart';
import 'package:zakazflow/feat/widgets/titled_app_bar.dart';
import 'package:zakazflow/resources/resources.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Добро пожаловать,',
                          style: TextStyle(
                            fontSize: 28,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Firstname',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 28,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: AppColors.white,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MenuTile(
                          icon: CustomIcons.person,
                          text: 'Username Surname',
                          subText: '+7 747 777 77 77',
                          onClick: () {}),
                      MenuTile(
                        icon: CustomIcons.order,
                        text: context.localized.my_sessions,
                        onClick: () {},
                      ),
                      MenuTile(
                        icon: CustomIcons.globe,
                        subText: 'Русский',
                        text: context.localized.app_language,
                        onClick: () {},
                      ),
                      MenuTile(
                        icon: CustomIcons.question,
                        text: context.localized.help_contacts,
                        onClick: () {},
                      ),
                      MenuTile(
                        icon: CustomIcons.logout,
                        text: context.localized.logout,
                        onClick: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

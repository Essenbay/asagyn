import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/profilemenu/widgets/menu_tile.dart';
import 'package:zakazflow/feat/widgets/titled_app_bar.dart';
import 'package:zakazflow/resources/resources.dart';

@RoutePage()
class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitledAppBar(titleText: context.localized.menu),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MenuTile(
                icon: CustomIcons.person,
                text: 'Username Surname',
                subText: '+7 747 777 77 77',
                onClick: () {}),
            MenuTile(
              icon: CustomIcons.globe,
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
    );
  }
}

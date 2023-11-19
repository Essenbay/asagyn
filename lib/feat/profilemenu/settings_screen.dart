import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/core/services/app_status/app_bloc.dart';
import 'package:zakazflow/core/services/language_provder/language_cubit.dart';
import 'package:zakazflow/feat/profilemenu/language/language_modal.dart';
import 'package:zakazflow/feat/profilemenu/widgets/menu_tile.dart';

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
                          onClick: () =>
                              context.router.push(ProfileDetailRoute())),
                      MenuTile(
                        icon: CustomIcons.order,
                        text: context.localized.my_sessions,
                        onClick: () {
                          context.router.push(MySessionsRoute());
                        },
                      ),
                      BlocBuilder<LanguageCubit, Languages>(
                        builder: (context, state) {
                          return MenuTile(
                            icon: CustomIcons.globe,
                            subText: state.str,
                            text: context.localized.app_language,
                            onClick: () => showLanguageSelectModal(context),
                          );
                        },
                      ),
                      MenuTile(
                        icon: CustomIcons.logout,
                        text: context.localized.logout,
                        onClick: () {
                          context.read<AppBloc>().add(AppEvent.logout());
                        },
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

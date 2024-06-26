import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/core/services/app_status/app_bloc.dart';
import 'package:zakazflow/core/services/language_provder/language_cubit.dart';
import 'package:zakazflow/feat/profilemenu/logic/fetch_profile_bloc.dart';
import 'package:zakazflow/feat/profilemenu/widgets/language_modal.dart';
import 'package:zakazflow/feat/profilemenu/widgets/menu_tile.dart';
import 'package:zakazflow/feat/session/logic/pusher_provider.dart';

import 'package:zakazflow/resources/resources.dart';

@RoutePage(name: 'SettingsRouter')
class SettingsRouterPage extends AutoRouter {}

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary,
                AppColors.primary400,
                AppColors.primary300,
              ],
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: BlocBuilder<FetchProfileBloc, FetchProfileState>(
            builder: (context, profileState) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            '${context.localized.welcome}',
                            style: const TextStyle(
                              fontSize: 28,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          profileState.maybeMap(
                              success: (value) => Text(
                                    ', ${value.data.username}',
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              orElse: () => const SizedBox())
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
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
                        profileState.map(
                            loading: (_) => const SizedBox(),
                            success: (state) => MenuTile(
                                icon: CustomIcons.person,
                                text: state.data.username,
                                subText: state.data.email,
                                onClick: () => context.router
                                    .push(const ProfileDetailRoute())),
                            failure: (_) => const SizedBox()),
                        MenuTile(
                          icon: CustomIcons.order,
                          text: context.localized.my_sessions,
                          onClick: () {
                            context.router.push(const MySessionsRoute());
                          },
                        ),
                        BlocBuilder<LanguageCubit, Languages>(
                          builder: (context, state) {
                            return MenuTile(
                              icon: CustomIcons.globe,
                              showArrow: false,
                              subText: state.str,
                              text: context.localized.app_language,
                              onClick: () => showLanguageSelectModal(context),
                            );
                          },
                        ),
                        MenuTile(
                          icon: CustomIcons.logout,
                          text: context.localized.logout,
                          showArrow: false,
                          onClick: () {
                            context
                                .read<AppBloc>()
                                .add(const AppEvent.logout());
                            context.read<PusherProvider>().disconnect();
                            context.router.pushAndPopUntil(const LoginRoute(),
                                predicate: ModalRoute.withName('/'));
                          },
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

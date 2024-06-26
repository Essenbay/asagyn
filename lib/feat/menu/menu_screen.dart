import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/core/services/language_provder/language_cubit.dart';
import 'package:zakazflow/feat/menu/fragments/menu_tab_bar.dart';
import 'package:zakazflow/feat/menu/logic/menu_bloc.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/order_controller.dart';
import 'package:zakazflow/feat/menu/widgets/count_up_total_fading.dart';
import 'package:zakazflow/feat/menu/widgets/sort_button.dart';
import 'package:zakazflow/feat/session/logic/session_bloc.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/error_widget.dart';
import 'package:zakazflow/feat/widgets/messaged_screen.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/feat/widgets/titled_app_bar.dart';
import 'package:zakazflow/resources/resources.dart';

part 'widgets/cart_floated_modal.dart';
part 'fragments/menu_success.dart';

@RoutePage(name: 'MenuRouter')
class MenuRouterPage extends AutoRouter implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderController(products: []),
      child: this,
    );
  }
}

@RoutePage()
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TitledAppBar(
          titleText: context.localized.menu,
          actionWidget: BlocBuilder<SessionBloc, SessionState>(
            builder: (context, state) {
              return state.maybeMap(
                  success: (value) => Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            value.data?.establishmentDTO.establishmentName ??
                                '',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                  orElse: () => const SizedBox());
            },
          ),
        ),
        body: BlocBuilder<SessionBloc, SessionState>(
          builder: (context, state) {
            return state.map(
                loading: (value) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                failure: (state) => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomErrorWidget(
                          errorMessage: state.exception.message(context),
                          request: () => context
                              .read<SessionBloc>()
                              .add(const SessionEvent.fetch()),
                        ),
                      ),
                    ),
                success: (sessionState) => sessionState.data == null
                    ? MessagedScreen(
                        iconPath: CustomIcons.emptyTable,
                        message: context.localized.empty_sessions,
                        buttonText: context.localized.create_session,
                        buttonOnTap: () {
                          AutoTabsRouter.of(context).setActiveIndex(0);
                        })
                    : BlocBuilder<MenuBloc, MenuState>(
                        builder: (context, state) {
                        return state.map(
                          loading: (state) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          success: (state) => MenuSuccess(model: state.data),
                          failure: (state) => Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: CustomErrorWidget(
                                  errorMessage:
                                      state.exception.message(context),
                                  request: () {
                                    final estabIs =
                                        sessionState.data?.establishmentDTO.id;
                                    if (estabIs != null) {
                                      context
                                          .read<MenuBloc>()
                                          .add(MenuEvent.fetch(estabIs));
                                    }
                                  }),
                            ),
                          ),
                        );
                      }));
          },
        ),
      ),
    );
  }
}

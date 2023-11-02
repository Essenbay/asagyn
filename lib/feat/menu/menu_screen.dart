import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/feat/menu/fragments/menu_tab_bar.dart';
import 'package:zakazflow/feat/menu/logic/menu_bloc.dart';
import 'package:zakazflow/feat/menu/logic/order_controller.dart';
import 'package:zakazflow/feat/session/logic/session_bloc.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/error_widget.dart';
import 'package:zakazflow/feat/widgets/messaged_screen.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/feat/widgets/titled_app_bar.dart';
import 'package:zakazflow/resources/resources.dart';

part 'widgets/cart_floated_modal.dart';

@RoutePage(name: 'MenuRouter')
class MenuRouterPage extends AutoRouter implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MenuBloc>()..add(const MenuEvent.fetch()),
      child: ChangeNotifierProvider(
        create: (context) => OrderController(products: []),
        child: this,
      ),
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
                            value.data?.establishmentName ?? '',
                            style: TextStyle(
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
                loading: (value) => Center(
                      child: CircularProgressIndicator(),
                    ),
                failure: (state) => Center(
                      child: CustomErrorWidget(
                        errorMessage: state.exception.message(context),
                        request: () => context
                            .read<SessionBloc>()
                            .add(const SessionEvent.fetch()),
                      ),
                    ),
                success: (state) => state.data == null
                    ? MessagedScreen(
                        iconPath: CustomIcons.emptyTable,
                        message: 'У вас нет никаких сессии',
                        buttonText: context.localized.create_session,
                        buttonOnTap: () {})
                    : BlocBuilder<MenuBloc, MenuState>(
                        builder: (context, state) {
                        return state.map(
                          loading: (state) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          success: (state) => Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: CustomTextField(
                                      hintText: 'Поиск',
                                      prefix: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Icon(Icons.search)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    width: 55,
                                    child: PopupMenuButton(
                                        shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
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
                                              PopupMenuItem<int>(
                                                value: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text('По названию'),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 2,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child:
                                                      Text('Сначало дешевые'),
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 3,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child:
                                                      Text('Сначало дорогие'),
                                                ),
                                              ),
                                            ]),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Expanded(child: MenuTabBar(model: state.data!))
                            ],
                          ),
                          failure: (state) => Center(
                            child: CustomErrorWidget(
                              errorMessage: state.exception.message(context),
                              request: () => context
                                  .read<SessionBloc>()
                                  .add(const SessionEvent.fetch()),
                            ),
                          ),
                        );
                      }));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _CartFloatedModal(),
      ),
    );
  }
}

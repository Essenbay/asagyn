import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/session/logic/session_bloc.dart';
import 'package:zakazflow/feat/session/widgets/order_widget.dart';
import 'package:zakazflow/feat/session/widgets/receipt_collapsed.dart';
import 'package:zakazflow/feat/session/widgets/receipt_expanded.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';
import 'package:zakazflow/feat/widgets/error_widget.dart';
import 'package:zakazflow/feat/widgets/messaged_screen.dart';
import 'package:zakazflow/resources/resources.dart';

@RoutePage()
class MySessionDetailScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const MySessionDetailScreen(
      {super.key, required this.id, required this.backgroundImage});
  final int id;
  final String? backgroundImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: context.screenSize.width,
            height: context.screenSize.height,
            child: const ColoredBox(color: AppColors.white)),
        //Background Image
        if (backgroundImage != null)
          CachedNetworkImage(
            imageUrl: backgroundImage!,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            height: context.screenSize.height * .4,
          )
        else
          Container(
            constraints:
                BoxConstraints(maxHeight: context.screenSize.height * .5),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary,
                  AppColors.primary400,
                  AppColors.primary300,
                  AppColors.primary200,
                  AppColors.white,
                ],
              ),
            ),
          ),

        //Image shadow
        if (backgroundImage != null)
          Container(
            height: context.screenSize.height * .3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const BackIconLeadingAppBar(),
          body: BlocBuilder<SessionBloc, SessionState>(
            builder: (context, state) => state.map(
              loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              failure: (state) => CustomErrorWidget(
                errorMessage: state.exception.message(context),
                request: () =>
                    context.read<SessionBloc>().add(SessionEvent.fetch(id: id)),
              ),
              success: (state) => state.data == null
                  ? MessagedScreen(
                      iconPath: CustomIcons.emptyTable,
                      message: context.localized.session_not_found,
                      buttonText: context.localized.back,
                      buttonOnTap: () {
                        context.router.pop();
                      })
                  : BottomSheetBar(
                      locked: false,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0),
                      ),
                      boxShadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1.0,
                          blurRadius: 15.0,
                        ),
                      ],
                      height: state.data!.orders.isEmpty ? 0 : 80,
                      collapsed: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ReceiptCollapsed(
                          model: state.data!,
                          showAskBill: false,
                        ),
                      ),
                      expandedBuilder: (controller) => ReceiptExpanded(
                        model: state.data!,
                        showAskBill: false,
                      ),
                      body: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 40, top: 10),
                            child: Text(
                              state.data!.establishmentDTO.establishmentName,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )),
                            child: state.data!.orders.isEmpty
                                ? ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                        height: context.screenSize.height * .5),
                                    child: Center(
                                      child: MessagedScreen(
                                        //TODO: Change icon to like 'Empty order list'
                                        iconPath: CustomIcons.menu,
                                        message: context.localized.orders_empty,
                                        buttonText: context.localized.to_menu,
                                        buttonOnTap: () =>
                                            AutoTabsRouter.of(context)
                                                .setActiveIndex(1),
                                      ),
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 20),
                                        child: Text(
                                            '${context.localized.orders}:',
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 30),
                                        child: Column(
                                          children: state.data!.orders
                                              .map(
                                                  (e) => OrdersWidget(model: e))
                                              .toList(),
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SessionBloc(getIt())..add(SessionEvent.fetch(id: id)),
      child: this,
    );
  }
}

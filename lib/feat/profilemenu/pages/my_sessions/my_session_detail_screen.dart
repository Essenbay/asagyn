import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/profilemenu/pages/my_sessions/logic/session_orders_bloc.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/widgets/order_widget.dart';
import 'package:zakazflow/feat/session/widgets/receipt_collapsed.dart';
import 'package:zakazflow/feat/session/widgets/receipt_expanded.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';
import 'package:zakazflow/feat/widgets/error_widget.dart';
import 'package:zakazflow/feat/widgets/server_image.dart';

@RoutePage()
class MySessionDetailScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const MySessionDetailScreen({super.key, required this.data});
  final SessionModel data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: context.screenSize.width,
            height: context.screenSize.height,
            child: const ColoredBox(color: AppColors.white)),
        //Background Image
        if (data.establishmentDTO.backgroundImage != null)
          ServerImage(
            imageUrl: data.establishmentDTO.backgroundImage!,
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
        if (data.establishmentDTO.backgroundImage != null)
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
        BlocBuilder<SessionOrdersBloc, SessionOrdersState>(
          builder: (context, state) {
            final orderItems = state.maybeMap(
              success: (state) => state.data.fold<List<OrderItem>>(
                  [], (prev, curr) => [...prev, ...curr.orderItemDTOS]),
              orElse: () => <OrderItem>[],
            );
            final total = orderItems.fold(
                0.0, (prev, curr) => prev + (curr.cost * curr.quantity));

            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: const BackIconLeadingAppBar(),
              body: BottomSheetBar(
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
                height: orderItems.isEmpty ? 0 : 80,
                collapsed: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ReceiptCollapsed(
                      model: data, showAskBill: false, total: total),
                ),
                expandedBuilder: (controller) => state.maybeMap(
                  success: (value) => ReceiptExpanded(
                    model: data,
                    showAskBill: false,
                    orderItems: orderItems,
                    total: total,
                  ),
                  orElse: () => const SizedBox(),
                ),
                body: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 40, top: 10),
                      child: Text(
                        data.establishmentDTO.establishmentName,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    state.map(
                      loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      failure: (state) => CustomErrorWidget(
                        errorMessage: state.exception.message(context),
                        request: () => context
                            .read<SessionOrdersBloc>()
                            .add(SessionOrdersEvent.fetch(data.id)),
                      ),
                      success: (state) => Container(
                        decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: state.data.isEmpty
                            ? Center(
                                child: Text(context.localized.orders_empty),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 20),
                                    child: Text('${context.localized.orders}:',
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: state.data
                                          .map((e) => OrdersWidget(model: e))
                                          .toList(),
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SessionOrdersBloc(getIt())..add(SessionOrdersEvent.fetch(data.id)),
      child: this,
    );
  }
}

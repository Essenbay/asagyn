import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/menu/logic/create_order_bloc.dart';
import 'package:zakazflow/feat/menu/logic/menu_repository.dart';
import 'package:zakazflow/feat/menu/logic/order_controller.dart';
import 'package:zakazflow/feat/menu/logic/order_request.dart';
import 'package:zakazflow/feat/menu/widgets/menu_product_tile_item.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/primary_button.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

@RoutePage(name: 'CreateOrderDialogPage')
class CreateOrderDialog extends StatelessWidget implements AutoRouteWrapper {
  const CreateOrderDialog();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackIconLeadingAppBar(
        title: context.localized.your_order,
        leadingWidth: 80,
        actions: [
          PrimaryButton(
              child: const Icon(
                CupertinoIcons.delete,
                color: AppColors.black,
              ),
              onPressed: () {
                context.read<OrderController>().clearCart();
                context.router.pop();
              })
        ],
      ),
      body: Consumer<OrderController>(
        builder: (context, value, child) => ListView(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${context.localized.dishes}:',
                style:
                    const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 5),
            ...value.products
                .map((e) => MenuProductTileItem(model: e))
                .toList(),
            // CheckInput(
            //     value: value.giveDrinksFirst,
            //     onChange: (newVal) => value.giveDrinksFirst = newVal),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Text(
            //     '${context.localized.note}:',
            //     style:
            //         const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            //   ),
            // ),
            // const SizedBox(height: 5),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: CustomTextField(
            //     hintText: context.localized.enter_note,
            //     maxLines: 5,
            //     controller: value.noteController,
            //   ),
            // ),
            const SizedBox(height: 70),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocListener<CreateOrderBloc, CreateOrderState>(
        listener: (context, state) => state.mapOrNull(
          loading: (value) => context.loaderOverlay.show(),
          failure: (value) {
            context.loaderOverlay.hide();
            Util.showSnackBar(context, value.exception.message(context));
            return null;
          },
          success: (value) {
            context.loaderOverlay.hide();
            context.read<OrderController>().clearCart();
            context.router.pop();
            AutoTabsRouter.of(context).setActiveIndex(0);
            return null;
          },
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: PrimaryFilledTextButton(
              onPressed: () {
                final provider = context.read<OrderController>();
                final data = OrderRequest(
                    items: provider.products
                        .map((e) =>
                            OrderItemRequest(id: e.id, quantity: e.quantity))
                        .toList(),
                    note: provider.noteController.text,
                    serveDrinksImmediatly: provider.giveDrinksFirst);
                context
                    .read<CreateOrderBloc>()
                    .add(CreateOrderEvent.create(data));
              },
              text: context.localized.confirm_order),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateOrderBloc(getIt<MenuRepository>()),
      child: this,
    );
  }
}

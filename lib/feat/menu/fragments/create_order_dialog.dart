import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/feat/menu/logic/order_controller.dart';
import 'package:zakazflow/feat/menu/widgets/chekc_input_tile.dart';
import 'package:zakazflow/feat/menu/widgets/menu_product_tile_item.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/primary_button.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

@RoutePage(name: 'CreateOrderDialogPage')
class CreateOrderDialog extends StatelessWidget {
  const CreateOrderDialog({required this.provider});
  final OrderController provider;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => provider,
      child: Scaffold(
        appBar: BackIconLeadingAppBar(
          title: 'Ваш заказ',
          leadingWidth: 80,
          actions: [
            PrimaryButton(
                child: Icon(
                  CupertinoIcons.delete,
                  color: AppColors.black,
                ),
                onPressed: () {
                  context.read<OrderController>().clearCart();
                })
          ],
        ),
        body: Consumer<OrderController>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              ...value.products
                  .map((e) => MenuProductTileItem(model: e))
                  .toList(),
              CheckInput(
                  value: value.giveDrinksFirst,
                  onChange: (newVal) => value.giveDrinksFirst = newVal),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Заметка:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              CustomTextField(
                hintText: 'Введите свою заметку',
                maxLines: 5,
                controller: value.noteController,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: PrimaryFilledTextButton(
              onPressed: () {}, text: 'Подтвердить заказ'),
        ),
      ),
    );
  }
}

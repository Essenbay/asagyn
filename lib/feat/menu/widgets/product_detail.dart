import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/order_controller.dart';
import 'package:zakazflow/feat/menu/widgets/counter_widget.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/feat/widgets/server_image.dart';

void showProductDetail(BuildContext context, ProductModel product) {
  final provider = context.read<OrderController>();
  Util.showCustomModalBottomSheet<void>(
    context: context,
    child: ChangeNotifierProvider.value(
      value: provider,
      child: ProductDetail(
        model: product,
        provider: provider,
      ),
    ),
    backgroundColor: Colors.transparent,
  );
}

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.model, required this.provider});
  final ProductModel model;
  final OrderController provider;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late int quantity = widget.provider.getQuantityForProduct(widget.model) ?? 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            ServerImage(
              imageUrl: widget.model.imageUrl,
              height: context.screenSize.height * .25,
              width: context.screenSize.width,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            if (widget.model.minAge != null)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(15))),
                  padding: const EdgeInsets.only(
                      top: 8, left: 10, right: 8, bottom: 10),
                  child: Text(
                    '${widget.model.minAge}+',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
          ],
        ),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.model.productName(context),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              if (widget.model.readyDuration != null)
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: AppColors.grey800,
                      size: 21,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${context.localized.cooking_time}:',
                      style: const TextStyle(
                          color: AppColors.grey800, fontSize: 15),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${widget.model.readyDuration!.minute} ${context.localized.minutes}',
                      style: const TextStyle(
                          color: AppColors.grey800, fontSize: 15),
                    ),
                  ],
                ),
              const SizedBox(height: 5),
              Text(
                widget.model.description,
                style: const TextStyle(color: AppColors.grey700),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.model.cost * quantity}₸',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  CounterView(
                    value: quantity,
                    minNumber: 1,
                    counterCallback: (value) => setState(() {
                      quantity = value;
                    }),
                    increaseCallback: () {},
                    decreaseCallback: () {},
                  )
                ],
              ),
              const SizedBox(height: 10),
              PrimaryFilledTextButton(
                height: 50,
                borderRadius: 15,
                fontSize: 16,
                onPressed: () {
                  context
                      .read<OrderController>()
                      .changeProductQuantity(widget.model, quantity);
                  context.router.pop();
                },
                text: context.localized.add,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

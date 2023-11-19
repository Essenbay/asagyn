import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/order_controller.dart';
import 'package:zakazflow/feat/menu/widgets/counter_widget.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

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
        CachedNetworkImage(
          imageUrl: widget.model.image,
          imageBuilder: (context, imageProvider) => Stack(
            alignment: Alignment.topRight,
            fit: StackFit.expand,
            children: [
              Image(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              if (widget.model.minAge != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(15))),
                    padding: const EdgeInsets.only(
                        top: 8, left: 10, right: 8, bottom: 10),
                    child: Text(
                      '${widget.model.minAge}+',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
            ],
          ),
          height: context.screenSize.height * .2,
          placeholder: (context, url) => ColoredBox(color: AppColors.grey400),
        ),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.model.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              if (widget.model.readyTime != null)
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: AppColors.grey800,
                      size: 21,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Время приготовления:',
                      style: TextStyle(color: AppColors.grey800, fontSize: 15),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.model.readyTime!,
                      style: TextStyle(color: AppColors.grey800, fontSize: 15),
                    ),
                  ],
                ),
              const SizedBox(height: 5),
              Text(
                widget.model.description,
                style: TextStyle(color: AppColors.grey700),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.model.cost * quantity}₸',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                text: 'Добавить',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

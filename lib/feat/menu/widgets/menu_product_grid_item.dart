import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/order_controller.dart';
import 'package:zakazflow/feat/menu/widgets/counter_widget.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/feat/widgets/server_image.dart';

class MenuProductGridItem extends StatelessWidget {
  const MenuProductGridItem({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primary300,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ServerImage(
                  imageUrl: model.imageUrl,
                  // imageBuilder: (context, imageProvider) => Stack(
                  //   alignment: Alignment.topRight,
                  //   fit: StackFit.expand,
                  //   children: [
                  //     Image(
                  //       image: imageProvider,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     if (model.minAge != null)
                  //       Positioned(
                  //         top: 0,
                  //         right: 0,
                  //         child: Container(
                  //           decoration: const BoxDecoration(
                  //               color: AppColors.primary,
                  //               borderRadius: BorderRadius.only(
                  //                   bottomLeft: Radius.circular(15))),
                  //           padding: const EdgeInsets.only(
                  //               top: 4, left: 6, right: 4, bottom: 6),
                  //           child: Text(
                  //             '${model.minAge}+',
                  //             style: const TextStyle(
                  //               color: AppColors.white,
                  //               fontSize: 13,
                  //               fontWeight: FontWeight.w700,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //   ],
                  // ),
                  // fit: BoxFit.cover,
                  // placeholder: (context, url) =>
                  //     const ColoredBox(color: AppColors.grey400),
                  // errorWidget: (context, error, stackTrace) => const Center(
                  //   child: Icon(
                  //     CupertinoIcons.exclamationmark_circle_fill,
                  //     color: AppColors.grey500,
                  //   ),
                  // ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        model.productName(context),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (model.readyDuration != null)
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: AppColors.black,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${model.readyDuration!.minute} ${context.localized.minutes}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    const SizedBox(height: 5),
                    Text(
                      '${model.cost}₸',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Consumer<OrderController>(
              builder: (context, value, child) {
                final quantity = value.getQuantityForProduct(model);
                return quantity == null || quantity < 1
                    ? PrimaryFilledTextButton(
                        height: 33,
                        borderRadius: 30,
                        fontSize: 14,
                        onPressed: () {
                          value.changeProductQuantity(model, 1);
                        },
                        text: context.localized.add,
                      )
                    : CounterView(
                        value: quantity,
                        counterCallback: (newVal) =>
                            value.changeProductQuantity(model, newVal),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}

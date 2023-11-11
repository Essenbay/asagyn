import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/order_controller.dart';
import 'package:zakazflow/feat/menu/widgets/counter_widget.dart';

class MenuProductTileItem extends StatelessWidget {
  const MenuProductTileItem({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 70),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: model.image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  )),
            ),
            width: 70,
            height: 70,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Flexible(
                  child: Text(
                    model.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.theme.textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${model.cost}₸',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CounterView(
            minNumber: 1,
            counterCallback: (value) {
              context.read<OrderController>().changeProductQuantity(model, value);
            },
            value: model.quantity,
            isHorizontal: false,
          ),
        ],
      ),
    );
  }
}

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/widgets/server_image.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key, required this.model});
  final OrderModel model;

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  final ExpandableController _controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ExpandablePanel(
          theme: const ExpandableThemeData(
              useInkWell: true,
              tapBodyToExpand: true,
              iconColor: AppColors.primary,
              iconPadding: EdgeInsets.symmetric(horizontal: 10),
              iconSize: 34),
          controller: _controller,
          header: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                getStatusIcon(),
                const SizedBox(width: 10),
                Text(
                  '${context.localized.order} №${widget.model.id}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          collapsed: const SizedBox(),
          expanded: Column(
            children: widget.model.orderItemDTOS
                .map((e) => Container(
                      constraints: const BoxConstraints(maxHeight: 70),
                      margin: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 10),
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ServerImage(
                            imageUrl: e.image ?? '',
                            borderRadius: 15,
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        e.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            context.theme.textTheme.titleSmall,
                                      ),
                                    ),
                                    Text(
                                      'x ${e.quantity}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          e.description,
                                          maxLines: 3,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: AppColors.grey700),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        e.cost.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          )),
    );
  }

  Widget getStatusIcon() => switch (widget.model.orderStatus) {
        OrderStatus.cooking => const Icon(Icons.soup_kitchen_rounded, size: 30),
        OrderStatus.processing =>
          const Icon(Icons.pending_actions_sharp, size: 30),
        OrderStatus.served => const Icon(Icons.room_service_rounded, size: 30),
        OrderStatus.serving => const Icon(Icons.table_bar, size: 30),
        OrderStatus.cancelled => const Icon(Icons.cancel, size: 30),
        OrderStatus.payed => const Icon(Icons.check, size: 30),
      };
}

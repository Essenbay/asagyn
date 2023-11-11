import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key, required this.model});
  final OrderModel model;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  final ExpandableController _controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ExpandablePanel(
          theme: ExpandableThemeData(
              useInkWell: true,
              tapBodyToExpand: true,
              iconColor: AppColors.primary,
              iconSize: 34),
          controller: _controller,
          header: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                getStatusIcon(),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Заказ №${widget.model.id}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Время подачи: ${DateFormat.Hm().format(widget.model.readyTime)}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          collapsed: const SizedBox(),
          expanded: Column(
            children: widget.model.items
                .map((e) => Container(
                      constraints: BoxConstraints(maxHeight: 70),
                      margin: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 10),
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CachedNetworkImage(
                            imageUrl: e.image,
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
                                      style: TextStyle(
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
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: AppColors.greyDark2),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        e.cost.toString(),
                                        style: TextStyle(
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

  Widget getStatusIcon() => switch (widget.model.status) {
        OrderStatus.cooking => Icon(Icons.soup_kitchen_rounded, size: 30),
        OrderStatus.processing => Icon(Icons.pending_actions_sharp, size: 30),
        OrderStatus.served => Icon(Icons.room_service_rounded, size: 30),
        OrderStatus.serving => Icon(Icons.table_bar, size: 30),
        OrderStatus.cancelled => Icon(Icons.cancel, size: 30),
        OrderStatus.payed => const SizedBox(),
      };
}

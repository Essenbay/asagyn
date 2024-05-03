import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:zakazflow/core/services/pusher/pusher_service.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

class PusherProvider extends ChangeNotifier {
  final PusherService _pusher;
  final List<OrderModel> _orders = [];
  List<OrderModel> get orders => _orders;

  PusherProvider(this._pusher);

  Future<void> init() async {
    _pusher.initPusher();
    _pusher.pusherEvents.listen(onPusherEvent);
  }

  void onPusherEvent(PusherEvent event) {
    if (event.eventName == 'order-create-event') {
      final json = jsonDecode(event.data as String);
      final orderJson = json['order'];
      final order = OrderModel.fromJson(orderJson as Map<String, dynamic>);
      _orders.add(order);
      notifyListeners();
      return;
    }
  }

  void setOrders(List<OrderModel> orders) {
    _orders.clear();
    _orders.addAll(orders);
    notifyListeners();
  }

  void disconnect() async {
    _pusher.disconnect();
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
@JsonSerializable(createFactory: false)

class OrderRequest {
  final List<OrderItemRequest> items;
  final String note;
  final bool serveDrinksImmediatly;

  OrderRequest({required this.items, required this.note, required this.serveDrinksImmediatly});
}

@JsonSerializable(createFactory: false)
class OrderItemRequest {
  final int id;
  final int quantity;

  OrderItemRequest({required this.id, required this.quantity});
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/feat/session/logic/models/establishment_model.dart';

part 'session_model.g.dart';

@JsonSerializable(createToJson: false)
class SessionModel {
  @JsonKey(defaultValue: 0)
  final double total;
  @JsonKey(defaultValue: 0)
  final double orderTotal;
  final DateTime? startDateTime;
  @JsonKey(defaultValue: [])
  final List<OrderModel> orders;
  final EstablishmentModel establishmentDTO;

  ///Products of orders at once
  final List<OrderItem> allItems;
  final List<PaymentMethod> paymentMethods;
  final int tableCode;

  SessionModel({
    required this.allItems,
    this.startDateTime,
    required this.establishmentDTO,
    required this.paymentMethods,
    required this.tableCode,
    required this.total,
    required this.orderTotal,
    required this.orders,
  });
  factory SessionModel.fromJson(Map<String, Object?> json) =>
      _$SessionModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PaymentMethod {
  final int id;
  final String name;

  PaymentMethod({required this.id, required this.name});

  factory PaymentMethod.fromJson(Map<String, Object?> json) =>
      _$PaymentMethodFromJson(json);
}

enum OrderStatus {
  @JsonValue(1)
  processing,
  @JsonValue(2)
  cooking,
  @JsonValue(3)
  serving,
  @JsonValue(4)
  served,
  @JsonValue(5)
  payed,
  @JsonValue(6)
  cancelled;
}

@JsonSerializable(createToJson: false)
class OrderModel {
  final OrderStatus status;
  final int id;
  final DateTime createdTime;
  final DateTime readyTime;
  final List<OrderItem> items;

  OrderModel(
      {required this.status,
      required this.id,
      required this.createdTime,
      required this.readyTime,
      required this.items});
  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class OrderItem {
  final String title;
  final String description;
  final int quantity;
  final double cost;
  final String image;

  OrderItem(
      {required this.title,
      required this.description,
      required this.quantity,
      required this.cost,
      required this.image});
  factory OrderItem.fromJson(Map<String, Object?> json) =>
      _$OrderItemFromJson(json);
}

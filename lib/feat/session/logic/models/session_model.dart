import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable(createToJson: false)
class SessionModel {
  final String establishmentName;
  final String backgroundImage;
  final double total;
  final double orderTotal;
  final double servingPercentage;
  final int servingAmount;
  final List<OrderModel> orders;
  SessionModel(
      {required this.establishmentName,
      required this.backgroundImage,
      required this.total,
      required this.orderTotal,
      required this.orders,
      required this.servingPercentage,
      required this.servingAmount});
  factory SessionModel.fromJson(Map<String, Object?> json) =>
      _$SessionModelFromJson(json);
}

enum OrderStatus {
  @JsonValue(1)
  processing,
  @JsonValue(2)
  cooking,
  @JsonValue(3)
  serving,
  @JsonValue(4)
  served;
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

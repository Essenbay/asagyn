import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/feat/session/logic/models/establishment_model.dart';

part 'session_model.g.dart';

@JsonSerializable(createToJson: false)
class SessionModel {
  final int id;
  final DateTime? startDateTime;
  final EstablishmentModel establishmentDTO;

  SessionModel({
    required this.id,
    this.startDateTime,
    required this.establishmentDTO,
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
  final List<OrderItem> items;

  OrderModel(
      {required this.status,
      required this.id,
      required this.createdTime,
      required this.items});
  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);

  static Map<String, Object?> toJson(
          {required int sessionId, required int productId}) =>
      {
        'dateOfCreation': DateTime.now().toIso8601String(),
        'diningSessionDTO': {
          // 'id': sessionId,
          // 'startDateTime': DateTime.now(),
        },
        'id': productId,
        'orderStatus': 'Cancelled'
      };
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

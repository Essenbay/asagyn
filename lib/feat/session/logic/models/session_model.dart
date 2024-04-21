import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/feat/session/logic/models/establishment_model.dart';

part 'session_model.g.dart';

@JsonSerializable()
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

  Map<String, Object?> toJson() => _$SessionModelToJson(this);
}

@JsonSerializable()
class PaymentMethod {
  final int id;
  final String name;

  PaymentMethod({required this.id, required this.name});

  factory PaymentMethod.fromJson(Map<String, Object?> json) =>
      _$PaymentMethodFromJson(json);
}

enum OrderStatus {
  @JsonValue('Processing')
  processing,
  @JsonValue('Cooking')
  cooking,
  @JsonValue('Serving')
  serving,
  @JsonValue('Server')
  served,
  @JsonValue('Payed')
  payed,
  @JsonValue('Cancelled')
  cancelled;
}

@JsonSerializable(createToJson: false)
class OrderModel {
  final OrderStatus orderStatus;
  final int id;
  final DateTime dateOfCreation;
  final List<OrderItem> orderItemDTOS;

  OrderModel(
      {required this.orderStatus,
      required this.id,
      required this.dateOfCreation,
      required this.orderItemDTOS});
  factory OrderModel.fromJson(Map<String, Object?> json) {
    log(json['orderItemDTOS'].toString());
    return _$OrderModelFromJson(json);
  }
}

@JsonSerializable()
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

  Map<String, Object?> toJson() => _$OrderItemToJson(this);
}

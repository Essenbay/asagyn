// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      id: json['id'] as int,
      startDateTime: json['startDateTime'] == null
          ? null
          : DateTime.parse(json['startDateTime'] as String),
      establishmentDTO: EstablishmentModel.fromJson(
          json['establishmentDTO'] as Map<String, dynamic>),
    );

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      id: json['id'] as int,
      name: json['name'] as String,
    );

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      id: json['id'] as int,
      createdTime: DateTime.parse(json['createdTime'] as String),
      readyTime: DateTime.parse(json['readyTime'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$OrderStatusEnumMap = {
  OrderStatus.processing: 1,
  OrderStatus.cooking: 2,
  OrderStatus.serving: 3,
  OrderStatus.served: 4,
  OrderStatus.payed: 5,
  OrderStatus.cancelled: 6,
};

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      title: json['title'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as int,
      cost: (json['cost'] as num).toDouble(),
      image: json['image'] as String,
    );

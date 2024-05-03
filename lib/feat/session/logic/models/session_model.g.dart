// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      id: json['id'] as int,
      startDateTime: DateTimeX.parseFromServer(json['startDateTime'] as String),
      establishmentDTO: EstablishmentModel.fromJson(
          json['establishmentDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDateTime': instance.startDateTime?.toIso8601String(),
      'establishmentDTO': instance.establishmentDTO,
    };

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      orderStatus:
          $enumDecodeNullable(_$OrderStatusEnumMap, json['orderStatus']) ??
              OrderStatus.processing,
      id: json['id'] as int,
      dateOfCreation:
          DateTimeX.parseFromServer(json['dateOfCreation'] as String),
      orderItemDTOS: (json['orderItemDTOS'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'id': instance.id,
      'dateOfCreation': instance.dateOfCreation.toIso8601String(),
      'orderItemDTOS': instance.orderItemDTOS,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.processing: 'Processing',
  OrderStatus.cooking: 'Cooking',
  OrderStatus.serving: 'Serving',
  OrderStatus.served: 'Server',
  OrderStatus.payed: 'Payed',
  OrderStatus.cancelled: 'Cancelled',
};

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      title: json['title'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as int,
      cost: (json['cost'] as num).toDouble(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'quantity': instance.quantity,
      'cost': instance.cost,
      'image': instance.image,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstablishmentModel _$EstablishmentModelFromJson(Map<String, dynamic> json) =>
    EstablishmentModel(
      id: json['id'] as int,
      establishmentName: json['establishmentName'] as String,
      servingPercentage: (json['servingPercentage'] as num).toDouble(),
      paymentMethods: (json['paymentMethods'] as List<dynamic>?)
          ?.map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
      backgroundImage: json['backgroundImage'] as String?,
    );

Map<String, dynamic> _$EstablishmentModelToJson(EstablishmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'establishmentName': instance.establishmentName,
      'servingPercentage': instance.servingPercentage,
      'backgroundImage': instance.backgroundImage,
      'paymentMethods': instance.paymentMethods,
    };

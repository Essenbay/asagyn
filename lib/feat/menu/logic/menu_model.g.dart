// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) => MenuModel(
      id: json['id'] as int,
      productItemDTOs: (json['productItemDTOs'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuModelToJson(MenuModel instance) => <String, dynamic>{
      'id': instance.id,
      'productItemDTOs': instance.productItemDTOs,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as int,
      nameEn: json['nameEn'] as String,
      nameKz: json['nameKz'] as String,
      nameRu: json['nameRu'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      startAvailableTime: json['startAvailableTime'] == null
          ? null
          : DateTime.parse(json['startAvailableTime'] as String),
      endAvailableTime: json['endAvailableTime'] == null
          ? null
          : DateTime.parse(json['endAvailableTime'] as String),
      minAge: json['minAge'] as int?,
      readyDuration: json['readyDuration'] == null
          ? null
          : DateTime.parse(json['readyDuration'] as String),
      imageUrl: json['imageUrl'] as String,
      cost: (json['cost'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameRu': instance.nameRu,
      'nameKz': instance.nameKz,
      'imageUrl': instance.imageUrl,
      'cost': instance.cost,
      'description': instance.description,
      'startAvailableTime': instance.startAvailableTime?.toIso8601String(),
      'endAvailableTime': instance.endAvailableTime?.toIso8601String(),
      'minAge': instance.minAge,
      'readyDuration': instance.readyDuration?.toIso8601String(),
      'categories': instance.categories,
    };

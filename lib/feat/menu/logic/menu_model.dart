import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:provider/provider.dart';
import 'package:zakazflow/core/services/language_provder/language_cubit.dart';
import 'package:zakazflow/feat/menu/widgets/sort_button.dart';
part 'menu_model.g.dart';

@JsonSerializable()
class MenuModel {
  final int id;
  final List<ProductModel> productItemDTOs;
  MenuModel({
    required this.id,
    required this.productItemDTOs,
  });

  void sortProducts(SortValue sortType) {
    switch (sortType) {
      case SortValue.name:
        productItemDTOs.sort((a, b) => a.nameEn.compareTo(b.nameEn));
        break;
      case SortValue.cheapFirst:
        productItemDTOs.sort((a, b) => a.cost.compareTo(b.cost));
        break;
      case SortValue.expensiveFirst:
        productItemDTOs.sort((a, b) => b.cost.compareTo(a.cost));
        break;
    }

    // categories.forEach((element) {
    //   element.sortProducts(sortType);
    // });
  }

  List<CategoryModel> get categories {
    Set<CategoryModel> uniqueCategories = Set<CategoryModel>();
    productItemDTOs.forEach((product) {
      uniqueCategories.addAll(product.categories);
    });
    return uniqueCategories.toList();
  }

  factory MenuModel.fromJson(Map<String, Object?> json) =>
      _$MenuModelFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  final String name;
  final int id;
  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, Object?> json) =>
      _$CategoryModelFromJson(json);
}

@JsonSerializable()
class ProductModel {
  final int id;
  final String nameEn;
  final String nameRu;
  final String nameKz;

  final String imageUrl;
  final double cost;
  final String description;
  final DateTime? startAvailableTime;
  final DateTime? endAvailableTime;
  final int? minAge;
  final DateTime? readyDuration;
  final List<CategoryModel> categories;

  @JsonKey(includeFromJson: false, includeToJson: false)
  int quantity;

  ProductModel(
      {required this.id,
      required this.nameEn,
      required this.nameKz,
      required this.nameRu,
      required this.categories,
      this.startAvailableTime,
      this.endAvailableTime,
      this.minAge,
      this.readyDuration,
      required this.imageUrl,
      this.quantity = 1,
      required this.cost,
      required this.description});

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);

  String productName(BuildContext context) {
    final state = context.read<LanguageCubit>().state;
    return switch (state) {
      Languages.ru => this.nameRu,
      Languages.kz => this.nameKz,
      Languages.en => this.nameEn,
    };
  }
}

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MenuModel {
  final List<CategoryModel> categories;
  final String establishmentName;
  final String backgroundImage;

  MenuModel(
      {required this.categories,
      required this.establishmentName,
      required this.backgroundImage});
}

@JsonSerializable()
class CategoryModel {
  final String name;
  final String? image;

  CategoryModel({required this.name, required this.image});
}

@JsonSerializable()
class ProductModel {
  final String name;
  final int quantity;
  final int cost;
  final String description;
  final int minAge;

  ProductModel(
      {required this.name,
      required this.minAge,
      required this.quantity,
      required this.cost,
      required this.description});
}

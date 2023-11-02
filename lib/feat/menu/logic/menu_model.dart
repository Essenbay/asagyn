import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MenuModel {
  final List<CategoryModel> categories;
  final String establishmentName;
  final List<ProductModel> allProducts;
  MenuModel({
    required this.categories,
    required this.allProducts,
    required this.establishmentName,
  });
}

@JsonSerializable()
class CategoryModel {
  final String name;
  final String? image;
  final List<ProductModel> products;
  CategoryModel(
      {required this.products, required this.name, required this.image});
}

@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String image;
  final double cost;
  final String description;
  final int? minAge;
  final String? readyTime;

  @JsonKey(includeFromJson: false, includeToJson: false)
  int quantity;

  ProductModel(
      {required this.id,
      required this.name,
      this.minAge,
      this.readyTime,
      required this.image,
      this.quantity = 1,
      required this.cost,
      required this.description});
}

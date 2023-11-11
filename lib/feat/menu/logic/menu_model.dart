import 'package:json_annotation/json_annotation.dart';
import 'package:zakazflow/feat/menu/widgets/sort_button.dart';

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

  void sortProducts(SortValue sortType) {
    switch (sortType) {
      case SortValue.name:
        allProducts.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortValue.cheapFirst:
        allProducts.sort((a, b) => a.cost.compareTo(b.cost));
        break;
      case SortValue.expensiveFirst:
        allProducts.sort((a, b) => b.cost.compareTo(a.cost));
        break;
    }
    categories.forEach((element) {
      element.sortProducts(sortType);
    });
  }
  
}

@JsonSerializable()
class CategoryModel {
  final String name;
  final String? image;
  final List<ProductModel> products;
  CategoryModel(
      {required this.products, required this.name, required this.image});

  void sortProducts(SortValue sortType) {
    switch (sortType) {
      case SortValue.name:
        products.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortValue.cheapFirst:
        products.sort((a, b) => a.cost.compareTo(b.cost));
        break;
      case SortValue.expensiveFirst:
        products.sort((a, b) => b.cost.compareTo(a.cost));
        break;
    }
  }
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

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';

class OrderController extends ChangeNotifier {
  final List<ProductModel> _products;
  List<ProductModel> get products => _products;
  final TextEditingController noteController = TextEditingController();
  bool _giveDrinksFirst = false;

  bool get giveDrinksFirst => _giveDrinksFirst;

  set giveDrinksFirst(bool value) {
    _giveDrinksFirst = value;
    notifyListeners();
  }

  double total = 0;

  OrderController({required List<ProductModel> products})
      : _products = products;

  void addToCart(ProductModel newProduct, int quantity) {
    newProduct.quantity = quantity;
    _products.removeWhere((element) => element.id == newProduct.id);
    _products.add(newProduct);
    total = calculateTotalCost(_products);
    notifyListeners();
  }

  double calculateTotalCost(List<ProductModel> products) {
    double totalCost = 0.0;

    for (final product in products) {
      totalCost += product.cost * product.quantity;
    }
    return totalCost;
  }

  void changeProductQuantity(ProductModel product, int newVal) {
    final index = _products.indexWhere((element) => element.id == product.id);
    if (index == -1) {
      product.quantity = newVal;
      _products.add(product);
    } else {}
    final addedProd = product.quantity = newVal;
    notifyListeners();
  }

  int? getQuantityForProduct(ProductModel model) {
    int? quantity = _products
        .singleWhereOrNull((element) => element.id == model.id)
        ?.quantity;
    return quantity;
  }

  void clearCart() {
    _products.clear();
    notifyListeners();
  }
}

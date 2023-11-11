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

  double _total = 0;

  double get total => _total;

  OrderController({required List<ProductModel> products})
      : _products = products;

  double calculateTotalCost(List<ProductModel> products) {
    double totalCost = 0.0;

    for (final product in products) {
      totalCost += product.cost * product.quantity;
    }
    return totalCost;
  }

  void changeProductQuantity(ProductModel product, int newVal) {
    if (newVal == 0) {
      _products.removeWhere((element) => element.id == product.id);
    } else {
      final listProduct =
          _products.singleWhereOrNull((element) => element.id == product.id);
      if (listProduct == null) {
        product.quantity = newVal;
        _products.add(product);
      } else {
        listProduct.quantity = newVal;
      }
    }
    _total = calculateTotalCost(products);
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
    _total = 0;
    notifyListeners();
  }
}

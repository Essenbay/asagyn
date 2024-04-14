import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/services/network/network_service.dart';
import 'package:zakazflow/core/util/example.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/order_request.dart';

abstract class MenuRepository {
  Future<Result<MenuModel>> getMenu(int estabId);
  Future<Result<void>> createOrder(OrderRequest data);
}

@LazySingleton(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  final NetworkService service;

  MenuRepositoryImpl({required this.service});

  @override
  Future<Result<void>> createOrder(OrderRequest data) {
    // TODO: implement createOrder
    throw UnimplementedError();
  }

  @override
  Future<Result<MenuModel>> getMenu(int estabId) async {
    final result = await service.request(
        request: (dio) => dio.get(
              '/menu/$estabId',
            ),
        fromJson: (json) {
          log(json.toString());
        });
    return Result.success(getMock());
  }

  MenuModel getMock() {
    final products = [
      ProductModel(
        id: 1,
        name: 'Бургер',
        image: productImage,
        minAge: null,
        cost: 1560,
        readyTime: '15 мин.',
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
      ),
      ProductModel(
        id: 2,
        name: 'Донер в лаваше куриный с фирменным соусом',
        minAge: 21,
        image: productImage,
        readyTime: '30 мин.',
        cost: 1200,
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
      ),
      ProductModel(
        id: 3,
        name: 'Фирменный соус',
        minAge: null,
        image: productImage,
        cost: 1500,
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
      ),
      ProductModel(
        id: 4,
        name: 'Каре молодого ягненка JOSPER',
        minAge: null,
        image: productImage,
        cost: 700,
        readyTime: '20 мин.',
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
      ),
      ProductModel(
        id: 5,
        name: 'Бургер',
        minAge: null,
        cost: 2010,
        image: productImage,
        description:
            'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
      ),
    ];
    final categories = [
      CategoryModel(
          name: 'Популярные блюда', image: productImage, products: products),
      CategoryModel(name: 'Новинки', image: productImage, products: products),
      CategoryModel(name: 'Бургеры', image: productImage, products: products),
      CategoryModel(name: 'Комбо', image: productImage, products: products)
    ];
    final menu = MenuModel(
      establishmentName: 'Malina Mix',
      categories: categories,
      allProducts: products,
    );
    return menu;
  }
}

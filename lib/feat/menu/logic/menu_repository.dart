import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/services/network/network_service.dart';
import 'package:zakazflow/core/services/preference_service.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/order_request.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

abstract class MenuRepository {
  Future<Result<MenuModel>> getMenuId(int estabId);
  Future<Result<MenuModel>> getMenuProducts(int menuId);
  Future<Result<void>> createOrder(OrderRequest data);
}

@LazySingleton(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  final NetworkService service;
  final PreferencesService prefs;
  MenuRepositoryImpl(this.prefs, {required this.service});

  @override
  Future<Result<void>> createOrder(OrderRequest data) async {
    final results = await data.items.map((e) async {
      final data = OrderModel.toJson(
          sessionId: prefs.currentSessionId ?? -1, productId: e.id);
      log(data.toString());
      final result = await service.request(
        request: (dio) => dio.post('/order', data: data),
        fromJson: (json) {
          log(json.toString());
        },
      );
      return result;
    });

    final result = results.firstOrNull;
    if (result == null) {
      return Result.failure(exception: NetworkException.emptyResponse());
    }

    return results.firstOrNull!;
  }

  @override
  Future<Result<MenuModel>> getMenuId(int estabId) async {
    final result = await service.request(
        request: (dio) => dio.get(
              '/menu/$estabId',
            ),
        fromJson: (json) {
          json as Map<String, dynamic>;
          return MenuModel.fromJson(json);
        });
    return result;
  }

  @override
  Future<Result<MenuModel>> getMenuProducts(int menuId) async {
    final result = await service.request(
      request: (dio) => dio.get('/product-item/$menuId'),
      fromJson: (json) {
        return MenuModel.fromJson(json as Map<String, dynamic>);
      },
    );
    return result;
  }

  // MenuModel getMock() {
  //   final products = [
  //     ProductModel(
  //       id: 1,
  //       nameEn: 'Бургер',
  //       imageUrl: productImage,
  //       minAge: null,
  //       cost: 1560,
  //       readyDuration: '15 мин.',
  //       description:
  //           'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
  //     ),
  //     ProductModel(
  //       id: 2,
  //       nameEn: 'Донер в лаваше куриный с фирменным соусом',
  //       minAge: 21,
  //       imageUrl: productImage,
  //       readyDuration: '30 мин.',
  //       cost: 1200,
  //       description:
  //           'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
  //     ),
  //     ProductModel(
  //       id: 3,
  //       nameEn: 'Фирменный соус',
  //       minAge: null,
  //       imageUrl: productImage,
  //       cost: 1500,
  //       description:
  //           'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
  //     ),
  //     ProductModel(
  //       id: 4,
  //       nameEn: 'Каре молодого ягненка JOSPER',
  //       minAge: null,
  //       imageUrl: productImage,
  //       cost: 700,
  //       readyDuration: '20 мин.',
  //       description:
  //           'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
  //     ),
  //     ProductModel(
  //       id: 5,
  //       nameEn: 'Бургер',
  //       minAge: null,
  //       cost: 2010,
  //       imageUrl: productImage,
  //       description:
  //           'Говядина, с кользами свежих томатов и репчатого лука, с хрустящим айсбергом и плавленным сыром Чеддер, заправлленная фирменным соусом',
  //     ),
  //   ];
  //   final categories = [
  //     CategoryModel(
  //         name: 'Популярные блюда', image: productImage, products: products),
  //     CategoryModel(name: 'Новинки', image: productImage, products: products),
  //     CategoryModel(name: 'Бургеры', image: productImage, products: products),
  //     CategoryModel(name: 'Комбо', image: productImage, products: products)
  //   ];
  //   final menu = MenuModel(
  //     establishmentName: 'Malina Mix',
  //     categories: categories,
  //     items: products,
  //   );
  //   return menu;
  // }
}

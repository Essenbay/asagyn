import 'package:injectable/injectable.dart';
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
    final jsonData = data.toJson();

    final result = await service.request(
      request: (dio) => dio.post('/order', data: jsonData),
      fromJson: (json) {
        final orderJson = json['object'];
        return OrderModel.fromJson(orderJson as Map<String, dynamic>);
      },
    );
    return result;

    // Result? failureReult = null;

    // return result.when(success: (order) async {
    //   for (var e in data.items) {
    //     final result = await service.request(
    //         request: (dio) => dio.post(
    //               '/order-item/${order.id}',
    //               data: e.toJson(),
    //             ),
    //         fromJson: (json) {
    //           log(json.toString());
    //         });

    //     result.whenOrNull(
    //       failure: (exception) {
    //         failureReult = Result<void>.failure(exception: exception);
    //       },
    //     );
    //   }
    //   return failureReult ?? const Result.success(null);
    // }, failure: (exception) async {
    //   return Result.failure(exception: exception);
    // });
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
}

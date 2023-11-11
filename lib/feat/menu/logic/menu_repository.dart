import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/order_request.dart';

abstract class MenuRepository {
  Future<Result<MenuModel>> getMenu();
  Future<Result<void>> createOrder(OrderRequest data);
}

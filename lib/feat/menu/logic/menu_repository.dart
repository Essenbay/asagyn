import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';

abstract class MenuRepository {
  Future<Result<MenuModel?>> getMenu();
}

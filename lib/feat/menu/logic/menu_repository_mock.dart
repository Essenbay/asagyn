import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/menu_repository.dart';

@Injectable(as: MenuRepository)
class MenuRepositoryMock implements MenuRepository {
  @override
  Future<Result<MenuModel?>> getMenu() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Result.success(null);
  }
}

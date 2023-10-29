import 'package:zakazflow/core/services/network/models/result.dart';

abstract class AuthRepository {
  Future<Result<void>> login({required String phoneNumber});
  Future<Result<void>> register({required String phoneNumber});
}

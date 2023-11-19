import 'package:zakazflow/core/services/network/models/result.dart';

abstract class AuthRepository {
  Future<Result<String>> login({required String login, required String password});
  Future<Result<void>> register({required String phoneNumber});
}

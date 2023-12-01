import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';

abstract class AuthRepository {
  Future<Result<String>> login(
      {required String login, required String password});
  Future<Result<void>> register({required String phoneNumber});
  Future<Result<void>> getCode({required String phoneNumber});
  Future<Result<String>> sendCode({required String code});
  Future<Result<void>> changePassword({required String password});
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Result<void>> changePassword({required String password}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> getCode({required String phoneNumber}) {
    // TODO: implement getCode
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login(
      {required String login, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> register({required String phoneNumber}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> sendCode({required String code}) {
    // TODO: implement sendCode
    throw UnimplementedError();
  }
}

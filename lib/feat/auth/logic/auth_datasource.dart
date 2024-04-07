import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/services/network/network_service.dart';

abstract class AuthDatasource {
  Future<Result<String>> login(
      {required String login, required String password});
  Future<Result<void>> register(
      {required String email,
      required String password,
      required String confirmPassword,
      required String fullname});
  Future<Result<void>> getCode({required String phoneNumber});
  Future<Result<String>> sendCode({required String code});
  Future<Result<void>> changePassword({required String password});
}

@LazySingleton(as: AuthDatasource)
class AuthRepositoryImpl implements AuthDatasource {
  final NetworkService network;

  AuthRepositoryImpl({required this.network});

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
      {required String login, required String password}) async {
    return await network.request(
      request: (dio) => dio.post(
        'auth',
        data: {
          'username': login,
          'password': password,
        },
      ),
      fromJson: (json) {
        return json['token'] as String;
      },
    );
  }

  @override
  Future<Result<String>> sendCode({required String code}) {
    // TODO: implement sendCode
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> register(
      {required String email,
      required String password,
      required String confirmPassword,
      required String fullname}) async {
    return await network.request(
      request: (dio) => dio.post(
        '/registration',
        data: {
          'username': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'email': email,
        },
      ),
      fromJson: (json) {},
    );
  }
}

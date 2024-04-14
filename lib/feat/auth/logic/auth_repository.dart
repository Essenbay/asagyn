import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/services/secure_storage_service.dart';
import 'package:zakazflow/feat/auth/logic/auth_datasource.dart';
import 'package:zakazflow/feat/profilemenu/logic/profile_model.dart';

abstract class AuthRepository {
  Future<Result<String>> login(
      {required String login, required String password});
  Future<Result<void>> register(
      {required String email,
      required String password,
      required String confirmPassword,
      required String fullname});
  Future<Result<void>> getCode({required String phoneNumber});
  Future<Result<String>> sendCode({required String code});
  Future<Result<void>> changeProfile({
    String? password,
    String? confirmPassword,
    String? email,
    String? username,
  });
  Future<Result<ProfileModel>> getProfile();
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  final SecureStorage storage;
  AuthRepositoryImpl(this.storage, {required this.datasource});

  @override
  Future<Result<void>> getCode({required String phoneNumber}) =>
      datasource.getCode(phoneNumber: phoneNumber);

  @override
  Future<Result<String>> login(
      {required String login, required String password}) async {
    final result = await datasource.login(login: login, password: password);
    result.mapOrNull(
      success: (result) {
        storage.setUser(result.data);
      },
    );
    return result;
  }

  @override
  Future<Result<String>> sendCode({required String code}) =>
      sendCode(code: code);

  @override
  Future<Result<void>> register(
          {required String email,
          required String password,
          required String confirmPassword,
          required String fullname}) =>
      datasource.register(
          email: email,
          password: password,
          fullname: fullname,
          confirmPassword: confirmPassword);

  @override
  Future<Result<void>> changeProfile(
          {String? password,
          String? confirmPassword,
          String? email,
          String? username}) =>
      datasource.changeProfile(
          password: password,
          confirmPassword: confirmPassword,
          email: email,
          username: username);

  @override
  Future<Result<ProfileModel>> getProfile() => datasource.getProfile();
}

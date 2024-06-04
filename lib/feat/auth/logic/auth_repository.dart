import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/services/secure_storage_service.dart';
import 'package:zakazflow/feat/auth/logic/auth_datasource.dart';
import 'package:zakazflow/feat/profilemenu/logic/profile_model.dart';

abstract class AuthRepository {
  Future<Result<String>> login(
      {required String login, required String password});
  Future<Result<void>> sendConfirmCode(String email);
  Future<Result<void>> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullname,
    required String code,
  });
  Future<Result<void>> changeProfile({
    String? password,
    String? confirmPassword,
    String? email,
    String? username,
  });
  Future<Result<ProfileModel>> getProfile();
  Future<Result<void>> sendPasswordResetCode(String email);
  Future<Result<void>> resetPassword(String email, String password,
      String confirmPassword, String confirmCode);
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  final SecureStorage storage;
  AuthRepositoryImpl(this.storage, {required this.datasource});

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
  Future<Result<void>> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullname,
    required String code,
  }) =>
      datasource.register(
        email: email,
        password: password,
        fullname: fullname,
        confirmPassword: confirmPassword,
        code: code,
      );

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

  @override
  Future<Result<void>> resetPassword(String email, String password,
          String confirmPassword, String confirmCode) =>
      datasource.resetPassword(email, password, confirmPassword, confirmCode);

  @override
  Future<Result<void>> sendPasswordResetCode(String email) =>
      datasource.sendPasswordResetCode(email);

  @override
  Future<Result<void>> sendConfirmCode(String email) =>
      datasource.sendConfirmCode(email);
}

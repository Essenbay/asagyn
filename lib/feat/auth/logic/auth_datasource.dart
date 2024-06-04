import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/services/network/network_service.dart';
import 'package:zakazflow/feat/profilemenu/logic/profile_model.dart';

abstract class AuthDatasource {
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

@LazySingleton(as: AuthDatasource)
class AuthRepositoryImpl implements AuthDatasource {
  final NetworkService network;

  AuthRepositoryImpl({required this.network});

  @override
  Future<Result<void>> changeProfile({
    String? password,
    String? confirmPassword,
    String? email,
    String? username,
  }) async {
    Map data = {};
    if (email != null) {
      data['email'] = email;
    }
    if (username != null) {
      data['username'] = username;
    }
    if (password != null) {
      data['newPassword'] = password;
      data['confirmPassword'] = confirmPassword;
    }
    final result = await network.request(
      request: (dio) => dio.post('/update-profile', data: data),
      fromJson: (json) {},
    );
    return result;
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
        log(json.toString());
        return json['token'] as String;
      },
    );
  }

  @override
  Future<Result<void>> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullname,
    required String code,
  }) async {
    return await network.request(
      request: (dio) => dio.post(
        '/registration',
        data: {
          'code': code,
          'registrationUserDto': {
            'username': fullname,
            'password': password,
            'confirmPassword': confirmPassword,
            'email': email,
          }
        },
      ),
      fromJson: (json) {
        return null;
      },
    );
  }

  @override
  Future<Result<ProfileModel>> getProfile() async {
    final result = await network.request(
        request: (dio) => dio.get('/get-profile'),
        fromJson: (json) {
          return ProfileModel.fromJson(json as Map<String, dynamic>);
        });
    return result;
  }

  @override
  Future<Result<void>> resetPassword(
    String email,
    String password,
    String confirmPassword,
    String confirmCode,
  ) async {
    final result = await network.request(
        request: (dio) => dio.post(
              '/reset-password',
              data: {
                'confirmCode': confirmCode,
                'confirmPassword': confirmPassword,
                'email': email,
                'newPassword': password,
              },
            ),
        fromJson: (json) {
          return null;
        });
    return result;
  }

  @override
  Future<Result<void>> sendPasswordResetCode(String email) async {
    final result = await network.request(
        request: (dio) => dio.post(
              '/send-password-reset-code',
              data: {
                'email': email,
              },
            ),
        fromJson: (json) {
          return null;
        });
    return result;
  }

  @override
  Future<Result<void>> sendConfirmCode(String email) async {
    final result = await network.request(
        request: (dio) => dio.post(
              '/send-confirm-code',
              data: {
                'email': email,
              },
            ),
        fromJson: (json) {
          return null;
        });
    return result;
  }
}

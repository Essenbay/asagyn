import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/storage/auth_storage.dart';

@LazySingleton()
class HandlerInterceptor extends Interceptor {
  final AuthStorage _authStorage;
  HandlerInterceptor(this._authStorage);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${_authStorage.tokenKey}';
    handler.next(options);
  }
}

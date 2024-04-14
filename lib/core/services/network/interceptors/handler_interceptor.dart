import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/secure_storage_service.dart';

@LazySingleton()
class HandlerInterceptor extends Interceptor {
  final SecureStorage _authStorage;
  HandlerInterceptor(this._authStorage);
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] =
        'Bearer ${await _authStorage.getTokenKey()}';
    handler.next(options);
  }
}

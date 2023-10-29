import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/extensions/dio.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception_type.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
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

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      final fromJson = response.requestOptions.extra['fromJson'] as Function;
      if (response.data is Map<String, dynamic>) {
        final result =
            Result.success(fromJson(response.data as Map<String, dynamic>));
        response.data = result;
      } else if (response.data is List) {
        final data = response.data as List;
        final result = Result.success(
            data.map((e) => fromJson(e as Map<String, dynamic>)).toList());
        response.data = result;
      }
      handler.next(response);
    } catch (e) {
      response.data = const Result<dynamic>.failure(
          exception: NetworkException('', NetworkExceptionTypes.type));
      handler.resolve(response);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response =
        err.response ?? Response(requestOptions: err.requestOptions);
    response.data = Result<Never>.failure(exception: err.networkException);
    handler.resolve(response);
  }
}

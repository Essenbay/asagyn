import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/interceptors/handler_interceptor.dart';
import 'package:zakazflow/core/services/network/interceptors/network_log_interceptor.dart';

@Singleton()
class NetworkService {
  final HandlerInterceptor _handlerInterceptor;
  final NetworkLoggerInterceptor _logInterceptor;

  NetworkService(this._dio, this._handlerInterceptor, this._logInterceptor) {
    _dio.interceptors.add(_handlerInterceptor);
    _dio.interceptors.add(_logInterceptor);

    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['City'] = 1;
  }

  final Dio _dio;

  Dio get dio => _dio;
}

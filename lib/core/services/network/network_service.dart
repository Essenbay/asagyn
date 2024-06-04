import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception_type.dart';
import 'package:zakazflow/core/services/network/interceptors/handler_interceptor.dart';
import 'package:zakazflow/core/services/network/interceptors/network_log_interceptor.dart';
import 'package:zakazflow/core/services/network/models/result.dart';

String baseUrl = 'https://33c9-185-18-253-110.ngrok-free.app';

@Singleton()
class NetworkService {
  final HandlerInterceptor _handlerInterceptor;
  final NetworkLoggerInterceptor _logInterceptor;

  NetworkService(this._dio, this._handlerInterceptor, this._logInterceptor) {
    _dio.interceptors.add(_handlerInterceptor);
    _dio.interceptors.add(_logInterceptor);
    // _dio.options.baseUrl = '$baseUrl/demo/mobile/api/';
    _dio.options.headers['Accept'] = 'application/json';
  }

  final Dio _dio;

  Dio get dio => _dio;

  void changeBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  Future<Result<T>> request<T>({
    required Future<Response> Function(Dio dio) request,
    required T Function(dynamic data) fromJson,
  }) async {
    try {
      final response = await request(_dio);
      final data = fromJson(response.data);
      return Result.success(data);
    } on DioException catch (e) {
      log(e.requestOptions.baseUrl);
      final exception = NetworkException.createFromDio(e);
      log(exception.toString());
      return Result<Never>.failure(exception: exception);
    } on TypeError catch (e) {
      final exception = NetworkException(
        'Error while parsing:  $T at ${request}. Message: $e',
        NetworkExceptionTypes.type,
      );
      log(exception.toString());
      return Result<Never>.failure(exception: exception);
    } catch (e) {
      final exception =
          NetworkException(e.toString(), NetworkExceptionTypes.unknown);
      log(exception.toString());
      return Result<Never>.failure(exception: exception);
    }
  }

  Future<void> setBaseUrl() async {
    // _dio.options.baseUrl = '$baseUrl/demo/mobile/api/';

    final Dio dio = Dio();
    try {
      final response = await dio.get<Map>(
          'https://api.jsonbin.io/v3/b/665eeb95ad19ca34f874085c',
          options: Options(headers: {
            'X-Master-Key':
                '''\$2a\$10\$1v.L355h8kb1606XDyydaexd/I.iqAQla0aE9eU1eg2i7htsSyTK.'''
          }));
      final resultBaseUrl = response.data?['record']['asagyn'] as String;
      _dio.options.baseUrl = '$resultBaseUrl/demo/mobile/api/';

      baseUrl = resultBaseUrl;
      return;
    } catch (e) {
      log('Error fetching url: $e');
      return;
    }
  }
}

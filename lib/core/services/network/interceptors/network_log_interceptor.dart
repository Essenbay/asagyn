import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

@LazySingleton()
class NetworkLoggerInterceptor extends Interceptor {
  void _log(void Function(StringBuffer buffer) assemble) {
    final buffer = StringBuffer('Network | ');

    assemble(buffer);

    l.d(buffer.toString());
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log((buffer) => buffer
      ..write('Request ')
      ..write('${options.path}     '));
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log((buffer) => buffer
      ..write(
          'Response ${response.statusCode} ${response.requestOptions.path}      '));
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      _log(
        (buffer) => buffer
          ..write(
              'Error ${err.requestOptions.path} ${err.response!.statusCode} ')
          ..write(err.response!.data),
      );
    } else {
      _log((buffer) =>
          buffer..write('Error ${err.requestOptions.path} ${err.type}'));
    }
    handler.next(err);
  }
}

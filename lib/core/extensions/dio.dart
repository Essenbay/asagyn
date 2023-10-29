import 'package:dio/dio.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';

extension DioExceptionX on DioException {
  NetworkException get networkException => NetworkException.create(this);
}

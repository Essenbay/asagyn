import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception_type.dart';

/// All status codes from backend will represented here
class StatusCodes {
  static const int unAuthenticated = 401;

  static const int notFound = 404;

  static const int serverError = 500;

  static const int unprocessable = 422;

  static const int needUpdate = 426;
}

class NetworkException implements Exception {
  const NetworkException(this.serverMessage, this.type) : super();
  factory NetworkException.createFromDio(DioException err) {
    if (_isUnauth(err)) {
      return NetworkException(
          err.message, NetworkExceptionTypes.unAuthenticated);
    } else if (_isConnectivity(err)) {
      return NetworkException(err.message, NetworkExceptionTypes.connectivity);
    } else if (_isNotFound(err)) {
      final message = _parseDioError(err);
      return NetworkException(message, NetworkExceptionTypes.notFound);
    } else if (_isTimeOut(err)) {
      return NetworkException(err.message, NetworkExceptionTypes.timeOut);
    } else if (_isUnauth(err)) {
      final message = _parseDioError(err);
      return NetworkException(message, NetworkExceptionTypes.unAuthenticated);
    }
    final message = _parseDioError(err);
    return NetworkException(message, NetworkExceptionTypes.serverError);
  }

  factory NetworkException.emptyResponse() {
    return const NetworkException(
        'Response data is empty', NetworkExceptionTypes.type);
  }

  ///Message
  final String? serverMessage;

  ///Predefined exception type
  final NetworkExceptionTypes type;

  ///Getter for message that will be showed in UI
  String message(BuildContext context) {
    return switch (type) {
      NetworkExceptionTypes.connectivity => context.localized.connection_error,
      NetworkExceptionTypes.notFound =>
        serverMessage ?? context.localized.not_found_message,
      NetworkExceptionTypes.serverError =>
        serverMessage ?? context.localized.server_error_message,
      NetworkExceptionTypes.timeOut => context.localized.timeout_message,
      NetworkExceptionTypes.type =>
        '${context.localized.type_exception_message}',
      NetworkExceptionTypes.unAuthenticated => context.localized.unauth_message,
      NetworkExceptionTypes.unknown => context.localized.unknown_error_message,
    };
  }

  static bool _isUnauth(DioException err) => false;
  // err.response?.statusCode == HttpStatus.unauthorized;

  static bool _isNotFound(DioException err) =>
      err.response?.statusCode == HttpStatus.notFound;

  static bool _isTimeOut(DioException err) =>
      err.type == DioExceptionType.receiveTimeout ||
      err.type == DioExceptionType.sendTimeout ||
      err.type == DioExceptionType.connectionTimeout;
  static bool _isConnectivity(DioException err) => err.error is SocketException;

  /// Decode error message
  static String? _parseDioError(DioException e) {
    try {
      if (e.response?.data != null ||
          e.response?.data is Map<String, dynamic>) {
        final data = e.response?.data as Map<String, dynamic>;
        final message = data['message'] as String?;

        return message?.isNotEmpty == true ? message : null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return '$type, $serverMessage';
  }
}

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
  factory NetworkException.create(DioException err) {
    if (_isUnauth(err)) {
      return NetworkException(
          err.message, NetworkExceptionTypes.unAuthenticated);
    } else if (_isConnectivity(err)) {
      return NetworkException(err.message, NetworkExceptionTypes.connectivity);
    } else if (_isNotFound(err)) {
      return NetworkException(err.message, NetworkExceptionTypes.notFound);
    } else if (_isTimeOut(err)) {
      return NetworkException(err.message, NetworkExceptionTypes.timeOut);
    } else if (_isServerError(err)) {
      final message = _parseDioError(err);
      return NetworkException(message, NetworkExceptionTypes.serverError);
    } else {
      return NetworkException(err.message, NetworkExceptionTypes.unknown);
    }
  }

  ///Message
  final String? serverMessage;

  ///Predefined exception type
  final NetworkExceptionTypes type;

  ///Getter for message that will be showed in UI
  String message(BuildContext context) {
    return switch (this.type) {
      NetworkExceptionTypes.connectivity =>
        context.localized.connectivity_error_message,
      NetworkExceptionTypes.notFound => context.localized.not_found_message,
      NetworkExceptionTypes.serverError =>
        serverMessage ?? context.localized.server_error_message,
      NetworkExceptionTypes.timeOut => context.localized.timeout_message,
      NetworkExceptionTypes.type => context.localized.type_exception_message,
      NetworkExceptionTypes.unAuthenticated => context.localized.unauth_message,
      NetworkExceptionTypes.unknown => context.localized.unknown_error_message,
    };
  }

  static bool _isUnauth(DioException err) =>
      err.response?.statusCode == StatusCodes.unAuthenticated;

  static bool _isNotFound(DioException err) =>
      err.response?.statusCode == StatusCodes.notFound;

  static bool _isServerError(DioException err) =>
      err.response?.statusCode == StatusCodes.serverError;

  static bool _isTimeOut(DioException err) =>
      err.type == DioExceptionType.receiveTimeout ||
      err.type == DioExceptionType.sendTimeout ||
      err.type == DioExceptionType.connectionTimeout;
  static bool _isConnectivity(DioException err) => err.error is SocketException;

  /// Decode error message
  static String? _parseDioError(DioException e) {
    final buffer = StringBuffer();

    if (e.response?.data != null || e.response?.data is Map<String, dynamic>) {
      final data = e.response?.data as Map<String, dynamic>;
      if (data['errors'] != null && data['errors'] is Map<String, dynamic>) {
        (data['errors'] as Map<String, dynamic>).forEach((key, value) {
          for (final element in value as List) {
            buffer.write('${element as String}\n');
          }
        });
      } else if (data['message'] != null && data['message'] is String) {
        buffer.write(data['message'] as String);
      }
    }
    final result = buffer.toString().trim();
    return result.isEmpty ? null : result;
  }
}

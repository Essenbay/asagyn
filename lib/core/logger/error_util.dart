// ignore_for_file: long-parameter-list,avoid-ignoring-return-values
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:l/l.dart';

sealed class ErrorUtil {
  ErrorUtil._();

  static Future<void> logError(
    Object exception, {
    StackTrace? stackTrace,
    String? hint,
  }) async {
    try {
      /// Не логируем ошибки в режиме дебага
      if (kDebugMode) {
        return;
      }
      if (exception is String) {
        return logMessage(
          exception,
          stackTrace: stackTrace,
          hint: hint,
          warning: true,
        );
      }
      l.e(exception, stackTrace ?? StackTrace.current);

      await FirebaseCrashlytics.instance.recordError(
        exception,
        stackTrace ?? StackTrace.current,
        reason: hint,
      );
    } on Object catch (error, stackTrace) {
      l.e('Произошло исключение "$error" в ErrorUtil.logError', stackTrace);
    }
  }

  static Future<void> onFlutterError(FlutterErrorDetails details) async {
    await FirebaseCrashlytics.instance.recordFlutterError(details);
  }

  static Future<void> logMessage(
    String message, {
    StackTrace? stackTrace,
    String? hint,
    bool warning = false,
    List<String>? params,
  }) async {
    try {
      l.e(message, stackTrace);
      await FirebaseCrashlytics.instance.log(message);
    } on Object catch (error, stackTrace) {
      l.e('Произошло исключение "$error" в ErrorUtil.logMessage', stackTrace);
    }
  }
}

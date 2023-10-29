import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = _Success<T>;
  const factory Result.failure({required NetworkException exception}) =
      _Failure<T>;
}

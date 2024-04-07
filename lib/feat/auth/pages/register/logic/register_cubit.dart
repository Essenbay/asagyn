import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/auth/logic/auth_repository.dart';

part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _repository;
  RegisterCubit(this._repository) : super(const RegisterState.initial());

  Future<void> register(
      {required String email,
      required String fullname,
      required String password,
      required String confirmPassword}) async {
    emit(const RegisterState.loading());
    final result = await _repository.register(
        email: email,
        password: password,
        fullname: fullname,
        confirmPassword: confirmPassword);
    result.map(
        success: (result) => emit(const RegisterState.success()),
        failure: (result) => emit(RegisterState.failure(result.exception)));
  }
}

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _InitialState;

  const factory RegisterState.loading() = _LoadingState;

  const factory RegisterState.success() = _SuccessState;

  const factory RegisterState.failure(NetworkException exception) =
      _FailureState;
}

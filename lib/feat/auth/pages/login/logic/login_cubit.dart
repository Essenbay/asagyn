import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/auth/logic/auth_repository.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repository;
  LoginCubit(this._repository) : super(const LoginState.initial());

  Future<void> login({required String login, required String password}) async {
    emit(const LoginState.loading());
    final result = await _repository.login(login: login, password: password);
    result.map(
        success: (result) => emit(LoginState.success(result.data)),
        failure: (result) => emit(LoginState.failure(result.exception)));
  }
}

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = _InitialState;

  const factory LoginState.loading() = _LoadingState;

  const factory LoginState.success(String token) = _SuccessState;

  const factory LoginState.failure(NetworkException exception) = _FailureState;
}

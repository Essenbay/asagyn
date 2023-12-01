import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/auth/logic/auth_repository.dart';

part 'forgot_password_bloc.freezed.dart';

@freezed
sealed class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _InitialState;

  const factory ForgotPasswordState.loading() = _LoadingState;

  const factory ForgotPasswordState.success() = _SuccessState;
  const factory ForgotPasswordState.codeSuccess(String token) =
      _CodeSuccessState;

  const factory ForgotPasswordState.failure(NetworkException exception) =
      _FailureState;
}

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.getCode(String phoneNumber) = GetCodeEvent;
  const factory ForgotPasswordEvent.sendCode(String code) = SendCodeEvent;
  const factory ForgotPasswordEvent.changePassword(
      String password, String token) = ChangePasswordEvent;
}

@Injectable()
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository _repository;
  ForgotPasswordBloc(this._repository)
      : super(const ForgotPasswordState.initial()) {
    on<ForgotPasswordEvent>((event, emit) => event.map(
        getCode: (event) => _getCode(event, emit),
        sendCode: (event) => _sendCode(event, emit),
        changePassword: (event) => _changePassword(event, emit)));
  }

  Future<void> _getCode(
      GetCodeEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(const ForgotPasswordState.loading());
    await Future.delayed(const Duration(seconds: 1));
    emit(ForgotPasswordState.success());

    // final result = await _repository.getCode(phoneNumber: event.phoneNumber);
    // emit(ForgotPasswordState.success());
    // result.map(
    //     success: (result) => emit(ForgotPasswordState.success()),
    //     failure: (result) =>
    //         emit(ForgotPasswordState.failure(result.exception)));
  }

  Future<void> _sendCode(
      SendCodeEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(const ForgotPasswordState.loading());
    await Future.delayed(const Duration(seconds: 1));
    emit(ForgotPasswordState.codeSuccess('token'));

    // final result = await _repository.sendCode(code: event.code);
    // result.map(
    //     success: (result) => emit(ForgotPasswordState.codeSuccess(result.data)),
    //     failure: (result) =>
    //         emit(ForgotPasswordState.failure(result.exception)));
  }

  Future<void> _changePassword(
      ChangePasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(const ForgotPasswordState.loading());
    await Future.delayed(const Duration(seconds: 1));
    emit(ForgotPasswordState.success());

    // final result = await _repository.changePassword(password: event.password);
    // result.map(
    //     success: (result) => emit(ForgotPasswordState.success()),
    //     failure: (result) =>
    //         emit(ForgotPasswordState.failure(result.exception)));
  }
}

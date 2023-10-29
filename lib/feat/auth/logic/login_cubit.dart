// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:zakazflow/core/services/network/exceptions/network_exception_type.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(const LoginState.initial());

//   Future<void> login({required String phoneNumber}) async {

//   }
// }

// @freezed
// sealed class LoginState with _$LoginState {
//   const factory LoginState.initial() = _InitialState;

//   const factory LoginState.loading() = _LoadingState;

//   const factory LoginState.success({required dynamic data}) = _SuccessState;

//   const factory LoginState.failure({
//     String? message,
//     required NetworkExceptionTypes type,
//   }) = _FailureState;
// }

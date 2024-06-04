import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/auth/logic/auth_repository.dart';
import 'package:zakazflow/feat/profilemenu/logic/profile_model.dart';

part 'change_profile_bloc.freezed.dart';

@freezed
sealed class ChangeProfileState with _$ChangeProfileState {
  const factory ChangeProfileState.initial() = _InitialState;

  const factory ChangeProfileState.loading() = _LoadingState;

  const factory ChangeProfileState.success(ProfileModel data) = _SuccessState;

  const factory ChangeProfileState.failure(NetworkException exception) =
      _FailureState;
}

@freezed
class ChangeProfileEvent with _$ChangeProfileEvent {
  const factory ChangeProfileEvent.change({
    required ProfileModel currProfile,
    String? password,
    String? confirmPassword,
    String? email,
    String? username,
  }) = _ChangeEvent;
}

@Injectable()
class ChangeProfileBloc extends Bloc<ChangeProfileEvent, ChangeProfileState> {
  final AuthRepository _repository;
  ChangeProfileBloc(this._repository)
      : super(const ChangeProfileState.initial()) {
    on<ChangeProfileEvent>((event, emit) => event.map(
          change: (event) => _change(event, emit),
        ));
  }

  Future<void> _change(
      _ChangeEvent event, Emitter<ChangeProfileState> emit) async {
    emit(const ChangeProfileState.loading());
    final result = await _repository.changeProfile(
      password: event.password,
      confirmPassword: event.confirmPassword,
      email: event.email,
      username: event.username,
    );

    result.map(
        success: (result) => emit(
              ChangeProfileState.success(
                ProfileModel(
                    id: 0,
                    username: event.username ?? event.currProfile.username,
                    email: event.email ?? event.currProfile.email),
              ),
            ),
        failure: (result) =>
            emit(ChangeProfileState.failure(result.exception)));
  }
}

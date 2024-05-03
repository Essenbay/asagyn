import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/auth/logic/auth_repository.dart';
import 'package:zakazflow/feat/profilemenu/logic/profile_model.dart';

part 'fetch_profile_bloc.freezed.dart';

@freezed
sealed class FetchProfileState with _$FetchProfileState {
  const factory FetchProfileState.loading() = _LoadingState;

  const factory FetchProfileState.success(ProfileModel data) = _SuccessState;

  const factory FetchProfileState.failure(NetworkException exception) =
      _FailureState;
}

@freezed
class FetchProfileEvent with _$FetchProfileEvent {
  const factory FetchProfileEvent.fetch() = _FetchEvent;
  const factory FetchProfileEvent.set(ProfileModel newData) = _SetEvent;
}

class FetchProfileBloc extends Bloc<FetchProfileEvent, FetchProfileState> {
  final AuthRepository _repository;
  FetchProfileBloc(this._repository)
      : super(const FetchProfileState.loading()) {
    on<FetchProfileEvent>((event, emit) => event.map(
          fetch: (event) => _fetch(event, emit),
          set: (event) => _set(event, emit),
        ));
  }

  Future<void> _fetch(
      _FetchEvent event, Emitter<FetchProfileState> emit) async {
    emit(const FetchProfileState.loading());
    final result = await _repository.getProfile();
    result.map(
        success: (result) => emit(FetchProfileState.success(result.data)),
        failure: (result) => emit(FetchProfileState.failure(result.exception)));
  }

  Future<void> _set(_SetEvent event, Emitter<FetchProfileState> emit) async {
    emit(const FetchProfileState.loading());
    emit(FetchProfileState.success(event.newData));
  }
}

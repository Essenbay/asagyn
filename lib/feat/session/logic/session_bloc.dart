import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/logic/session_repository.dart';

part 'session_bloc.freezed.dart';

@freezed
sealed class SessionState with _$SessionState {
  const factory SessionState.loading() = _LoadingState;

  const factory SessionState.success(SessionModel? data) = _SuccessState;

  const factory SessionState.failure(NetworkException exception) =
      _FailureState;
}

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.fetch({int? id}) = FetchEvent;
}

@Injectable()
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final SessionRepository _repository;
  SessionBloc(this._repository) : super(const SessionState.loading()) {
    on<SessionEvent>((event, emit) => event.map(
          fetch: (event) => _fetch(event, emit),
        ));
  }
  Future<void> _fetch(FetchEvent event, Emitter<SessionState> emit) async {
    emit(const SessionState.loading());

    final result = await _repository.getSessionInfo();
    result.map(
      success: (result) => emit(SessionState.success(result.data)),
      failure: (result) => emit(SessionState.failure(result.exception)),
    );
  }
}

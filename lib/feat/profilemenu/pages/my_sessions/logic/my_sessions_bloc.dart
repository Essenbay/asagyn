import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/profilemenu/pages/my_sessions/logic/session_preview_model.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/logic/session_repository.dart';

part 'my_sessions_bloc.freezed.dart';

@freezed
sealed class MySessionsState with _$MySessionsState {
  const factory MySessionsState.loading() = _LoadingState;

  const factory MySessionsState.success(List<SessionModel> data) =
      _SuccessState;

  const factory MySessionsState.failure(NetworkException exception) =
      _FailureState;
}

@freezed
class MySessionsEvent with _$MySessionsEvent {
  const factory MySessionsEvent.fetch() = FetchEvent;
}

@Injectable()
class MySessionsBloc extends Bloc<MySessionsEvent, MySessionsState> {
  final SessionRepository _repository;
  MySessionsBloc(this._repository) : super(const MySessionsState.loading()) {
    on<MySessionsEvent>((event, emit) => event.map(
          fetch: (event) => _fetch(event, emit),
        ));
  }

  Future<void> _fetch(FetchEvent event, Emitter<MySessionsState> emit) async {
    emit(const MySessionsState.loading());
    final result = await _repository.getSessions();
    result.map(
        success: (result) => emit(MySessionsState.success(result.data)),
        failure: (result) => emit(MySessionsState.failure(result.exception)));
  }
}

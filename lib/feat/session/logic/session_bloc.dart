import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/logic/session_repository.dart';
import 'package:zakazflow/core/services/pusher/pusher_service.dart';

part 'session_bloc.freezed.dart';

@freezed
sealed class SessionState with _$SessionState {
  const factory SessionState.loading() = _LoadingState;

  const factory SessionState.success(
      SessionModel? data, List<OrderModel> orders) = _SuccessState;

  const factory SessionState.failure(NetworkException exception) =
      _FailureState;
}

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.fetch({int? id}) = FetchEvent;
  const factory SessionEvent.create(String estabCode, String table) =
      _CreateEvent;
  const factory SessionEvent.closeSession() = _CloseSessionEvent;
}

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final SessionRepository _repository;
  final PusherService _pusherService;

  SessionBloc(this._repository, this._pusherService)
      : super(const SessionState.loading()) {
    on<SessionEvent>(
      (event, emit) => event.map(
        fetch: (event) => _fetch(event, emit),
        create: (event) => _create(event, emit),
        closeSession: (event) => _closeSession(event, emit),
      ),
    );
    _pusherService.pusherEvents.listen((event) {
      if (event.eventName == 'close-dining-session') {
        add(const SessionEvent.closeSession());
      }
    });
  }
  Future<void> _fetch(FetchEvent event, Emitter<SessionState> emit) async {
    emit(const SessionState.loading());

    final result = await _repository.getSessionInfo();

    await result.when(
      success: (data) async {
        if (data != null) {
          final orderResult = await _repository.getOrdersBySession(data.id);
          orderResult.map(success: (result) {
            emit(SessionState.success(data, result.data));
          }, failure: (result) {
            emit(SessionState.success(data, []));
          });
          final estabResult = await _repository
              .getEstablishmentInfo(data.establishmentDTO.id.toString());
          log(estabResult.toString());
        } else {
          emit(SessionState.success(data, []));
        }
      },
      failure: (exception) async => emit(SessionState.failure(exception)),
    );
  }

  Future<void> _create(_CreateEvent event, Emitter<SessionState> emit) async {
    emit(const SessionState.loading());
    final result =
        await _repository.createSession(event.estabCode, event.table);
    result.map(
        success: (result) => emit(SessionState.success(result.data, [])),
        failure: (result) => emit(SessionState.failure(result.exception)));
  }

  Future<void> _closeSession(
      _CloseSessionEvent event, Emitter<SessionState> emit) async {
    emit(const SessionState.success(null, []));
    await _repository.closeSession();
  }
}

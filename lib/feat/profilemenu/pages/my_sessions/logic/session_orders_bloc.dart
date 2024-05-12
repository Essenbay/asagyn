import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/logic/session_repository.dart';

part 'session_orders_bloc.freezed.dart';

@freezed
sealed class SessionOrdersState with _$SessionOrdersState {
  const factory SessionOrdersState.loading() = _LoadingState;

  const factory SessionOrdersState.success(List<OrderModel> data) =
      _SuccessState;

  const factory SessionOrdersState.failure(NetworkException exception) =
      _FailureState;
}

@freezed
class SessionOrdersEvent with _$SessionOrdersEvent {
  const factory SessionOrdersEvent.fetch(int sessionId) = _FetchEvent;
}

@Injectable()
class SessionOrdersBloc extends Bloc<SessionOrdersEvent, SessionOrdersState> {
  final SessionRepository _repository;
  SessionOrdersBloc(this._repository)
      : super(const SessionOrdersState.loading()) {
    on<SessionOrdersEvent>((event, emit) => event.map(
          fetch: (event) => _getOrders(event, emit),
        ),);
  }

  Future<void> _getOrders(
      _FetchEvent event, Emitter<SessionOrdersState> emit) async {
    emit(const SessionOrdersState.loading());
    final result = await _repository.getOrdersBySession(event.sessionId);
    result.map(
      success: (result) => emit(SessionOrdersState.success(result.data)),
      failure: (result) => emit(
        SessionOrdersState.failure(result.exception),
      ),
    );
  }
}

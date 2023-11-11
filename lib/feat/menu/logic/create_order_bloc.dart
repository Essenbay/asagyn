import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/menu/logic/menu_repository.dart';
import 'package:zakazflow/feat/menu/logic/order_request.dart';

part 'create_order_bloc.freezed.dart';

@freezed
sealed class CreateOrderState with _$CreateOrderState {
  const factory CreateOrderState.initial() = _InitialState;

  const factory CreateOrderState.loading() = _LoadingState;

  const factory CreateOrderState.success() = _SuccessState;

  const factory CreateOrderState.failure(NetworkException exception) =
      _FailureState;
}

@freezed
class CreateOrderEvent with _$CreateOrderEvent {
  const factory CreateOrderEvent.create(OrderRequest data) = CreateEvent;
}

@Injectable()
class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final MenuRepository _repository;
  CreateOrderBloc(this._repository) : super(const CreateOrderState.initial()) {
    on<CreateOrderEvent>((event, emit) => event.map(
          create: (event) => _create(event, emit),
        ));
  }
  Future<void> _create(
      CreateEvent event, Emitter<CreateOrderState> emit) async {
    emit(const CreateOrderState.loading());
    final result = await _repository.createOrder(event.data);
    result.map(
        success: (result) => emit(CreateOrderState.success()),
        failure: (result) => emit(CreateOrderState.failure(result.exception)));
  }
}

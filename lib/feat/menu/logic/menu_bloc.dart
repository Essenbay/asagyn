import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/exceptions/network_exception.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/logic/menu_repository.dart';

part 'menu_bloc.freezed.dart';

@freezed
sealed class MenuState with _$MenuState {
  const factory MenuState.loading() = _LoadingState;

  const factory MenuState.success({required MenuModel? data}) = _SuccessState;

  const factory MenuState.failure(NetworkException exception) = _FailureState;
}

@freezed
class MenuEvent with _$MenuEvent {
  const factory MenuEvent.fetch() = FetchEvent;
}

@Injectable()
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository _repository;
  MenuBloc(this._repository) : super(const MenuState.loading()) {
    on<MenuEvent>((event, emit) => event.map(
          fetch: (event) async => await _fetch(event, emit),
        ));
  }

  Future<void> _fetch(FetchEvent event, Emitter<MenuState> emit) async {
    emit(const MenuState.loading());
    final result = await _repository.getMenu();
    result.map(
        success: (result) => emit(MenuState.success(data: result.data)),
        failure: (result) => emit(MenuState.failure(result.exception)));
  }
}

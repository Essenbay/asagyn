import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/secure_storage_service.dart';

part 'app_bloc.freezed.dart';

enum AppState {
  launching,
  authenticated,
  unauthenticated,
}

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.checkAuth() = CheckAuthEvent;

  const factory AppEvent.login({required String token}) = LoginEvent;

  const factory AppEvent.logout() = LogoutEvent;
}

@Injectable()
class AppBloc extends Bloc<AppEvent, AppState> {
  final SecureStorage _secureStorage;

  AppBloc(this._secureStorage) : super(AppState.launching) {
    on<AppEvent>((event, emit) => event.map(
          checkAuth: (event) async => await _checkAuth(event, emit),
          login: (event) async => await _login(event, emit),
          logout: (event) async => await _logout(event, emit),
        ));
  }

  Future<void> _checkAuth(CheckAuthEvent event, Emitter<AppState> emit) async {
    final token = await _secureStorage.getTokenKey();
    if (token.isNotEmpty) {
      emit(AppState.authenticated);
    } else {
      emit(AppState.authenticated);
    }
  }

  Future<void> _login(LoginEvent event, Emitter<AppState> emit) async {
    await _secureStorage.setUser(event.token);
    emit(AppState.authenticated);
  }

  Future<void> _logout(LogoutEvent event, Emitter<AppState> emit) async {
    await _secureStorage.deleteUser();
    emit(AppState.unauthenticated);
  }
}

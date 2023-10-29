// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../feat/menu/logic/menu_bloc.dart' as _i18;
import '../../feat/menu/logic/menu_repository.dart' as _i6;
import '../../feat/menu/logic/menu_repository_mock.dart' as _i7;
import '../../feat/session/logic/session_bloc.dart' as _i19;
import '../../feat/session/logic/session_repository.dart' as _i14;
import '../../feat/session/logic/session_repository_mock.dart' as _i15;
import '../services/app_status/app_bloc.dart' as _i16;
import '../services/language_provder/language_cubit.dart' as _i17;
import '../services/network/interceptors/handler_interceptor.dart' as _i5;
import '../services/network/interceptors/network_log_interceptor.dart' as _i8;
import '../services/network/network_service.dart' as _i9;
import '../services/preference_service.dart' as _i11;
import '../services/secure_storage_service.dart' as _i13;
import '../services/storage/auth_storage.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthStorage>(
        () => _i3.AuthStorage(gh<_i4.FlutterSecureStorage>()));
    gh.lazySingleton<_i5.HandlerInterceptor>(
        () => _i5.HandlerInterceptor(gh<_i3.AuthStorage>()));
    gh.factory<_i6.MenuRepository>(() => _i7.MenuRepositoryMock());
    gh.lazySingleton<_i8.NetworkLoggerInterceptor>(
        () => _i8.NetworkLoggerInterceptor());
    gh.singleton<_i9.NetworkService>(_i9.NetworkService(
      gh<_i10.Dio>(),
      gh<_i5.HandlerInterceptor>(),
      gh<_i8.NetworkLoggerInterceptor>(),
    ));
    gh.singleton<_i11.PreferencesService>(
        _i11.PreferencesService(gh<_i12.SharedPreferences>()));
    gh.singleton<_i13.SecureStorage>(
        _i13.SecureStorage(gh<_i4.FlutterSecureStorage>()));
    gh.lazySingleton<_i14.SessionRepository>(
        () => _i15.SessionRepositoryMock());
    gh.factory<_i16.AppBloc>(() => _i16.AppBloc(gh<_i13.SecureStorage>()));
    gh.factory<_i17.LanguageCubit>(
        () => _i17.LanguageCubit(gh<_i11.PreferencesService>()));
    gh.factory<_i18.MenuBloc>(() => _i18.MenuBloc(gh<_i6.MenuRepository>()));
    gh.factory<_i19.SessionBloc>(
        () => _i19.SessionBloc(gh<_i14.SessionRepository>()));
    return this;
  }
}

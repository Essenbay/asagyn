// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../../feat/auth/logic/auth_repository.dart' as _i3;
import '../../feat/auth/pages/forgot_password/logic/forgot_password_bloc.dart'
    as _i6;
import '../../feat/menu/logic/create_order_bloc.dart' as _i19;
import '../../feat/menu/logic/menu_bloc.dart' as _i21;
import '../../feat/menu/logic/menu_repository.dart' as _i8;
import '../../feat/menu/logic/menu_repository_mock.dart' as _i9;
import '../../feat/session/logic/session_bloc.dart' as _i22;
import '../../feat/session/logic/session_repository.dart' as _i16;
import '../../feat/session/logic/session_repository_mock.dart' as _i17;
import '../services/app_status/app_bloc.dart' as _i18;
import '../services/language_provder/language_cubit.dart' as _i20;
import '../services/network/interceptors/handler_interceptor.dart' as _i7;
import '../services/network/interceptors/network_log_interceptor.dart' as _i10;
import '../services/network/network_service.dart' as _i11;
import '../services/preference_service.dart' as _i13;
import '../services/secure_storage_service.dart' as _i15;
import '../services/storage/auth_storage.dart' as _i4;

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
    gh.lazySingleton<_i3.AuthRepository>(() => _i3.AuthRepositoryImpl());
    gh.lazySingleton<_i4.AuthStorage>(
        () => _i4.AuthStorage(gh<_i5.FlutterSecureStorage>()));
    gh.factory<_i6.ForgotPasswordBloc>(
        () => _i6.ForgotPasswordBloc(gh<_i3.AuthRepository>()));
    gh.lazySingleton<_i7.HandlerInterceptor>(
        () => _i7.HandlerInterceptor(gh<_i4.AuthStorage>()));
    gh.factory<_i8.MenuRepository>(() => _i9.MenuRepositoryMock());
    gh.lazySingleton<_i10.NetworkLoggerInterceptor>(
        () => _i10.NetworkLoggerInterceptor());
    gh.singleton<_i11.NetworkService>(_i11.NetworkService(
      gh<_i12.Dio>(),
      gh<_i7.HandlerInterceptor>(),
      gh<_i10.NetworkLoggerInterceptor>(),
    ));
    gh.singleton<_i13.PreferencesService>(
        _i13.PreferencesService(gh<_i14.SharedPreferences>()));
    gh.singleton<_i15.SecureStorage>(
        _i15.SecureStorage(gh<_i5.FlutterSecureStorage>()));
    gh.lazySingleton<_i16.SessionRepository>(
        () => _i17.SessionRepositoryMock());
    gh.factory<_i18.AppBloc>(() => _i18.AppBloc(gh<_i15.SecureStorage>()));
    gh.factory<_i19.CreateOrderBloc>(
        () => _i19.CreateOrderBloc(gh<_i8.MenuRepository>()));
    gh.factory<_i20.LanguageCubit>(
        () => _i20.LanguageCubit(gh<_i13.PreferencesService>()));
    gh.factory<_i21.MenuBloc>(() => _i21.MenuBloc(gh<_i8.MenuRepository>()));
    gh.factory<_i22.SessionBloc>(
        () => _i22.SessionBloc(gh<_i16.SessionRepository>()));
    return this;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../feat/auth/logic/auth_datasource.dart' as _i14;
import '../../feat/auth/logic/auth_repository.dart' as _i15;
import '../../feat/auth/pages/forgot_password/logic/forgot_password_bloc.dart'
    as _i16;
import '../../feat/menu/logic/create_order_bloc.dart' as _i21;
import '../../feat/menu/logic/menu_bloc.dart' as _i22;
import '../../feat/menu/logic/menu_repository.dart' as _i18;
import '../../feat/profilemenu/my_sessions/logic/my_sessions_bloc.dart' as _i19;
import '../../feat/session/logic/session_bloc.dart' as _i20;
import '../../feat/session/logic/session_repository.dart' as _i12;
import '../services/app_status/app_bloc.dart' as _i13;
import '../services/language_provder/language_cubit.dart' as _i17;
import '../services/network/interceptors/handler_interceptor.dart' as _i5;
import '../services/network/interceptors/network_log_interceptor.dart' as _i6;
import '../services/network/network_service.dart' as _i7;
import '../services/preference_service.dart' as _i9;
import '../services/secure_storage_service.dart' as _i11;
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
    gh.lazySingleton<_i6.NetworkLoggerInterceptor>(
        () => _i6.NetworkLoggerInterceptor());
    gh.singleton<_i7.NetworkService>(_i7.NetworkService(
      gh<_i8.Dio>(),
      gh<_i5.HandlerInterceptor>(),
      gh<_i6.NetworkLoggerInterceptor>(),
    ));
    gh.singleton<_i9.PreferencesService>(
        _i9.PreferencesService(gh<_i10.SharedPreferences>()));
    gh.singleton<_i11.SecureStorage>(
        _i11.SecureStorage(gh<_i4.FlutterSecureStorage>()));
    gh.lazySingleton<_i12.SessionRepository>(
        () => _i12.SessionRepositoryImpl(service: gh<_i7.NetworkService>()));
    gh.factory<_i13.AppBloc>(() => _i13.AppBloc(gh<_i11.SecureStorage>()));
    gh.lazySingleton<_i14.AuthDatasource>(
        () => _i14.AuthRepositoryImpl(network: gh<_i7.NetworkService>()));
    gh.lazySingleton<_i15.AuthRepository>(() => _i15.AuthRepositoryImpl(
          gh<_i3.AuthStorage>(),
          datasource: gh<_i14.AuthDatasource>(),
        ));
    gh.factory<_i16.ForgotPasswordBloc>(
        () => _i16.ForgotPasswordBloc(gh<_i15.AuthRepository>()));
    gh.factory<_i17.LanguageCubit>(
        () => _i17.LanguageCubit(gh<_i9.PreferencesService>()));
    gh.lazySingleton<_i18.MenuRepository>(
        () => _i18.MenuRepositoryImpl(service: gh<_i7.NetworkService>()));
    gh.factory<_i19.MySessionsBloc>(
        () => _i19.MySessionsBloc(gh<_i12.SessionRepository>()));
    gh.factory<_i20.SessionBloc>(
        () => _i20.SessionBloc(gh<_i12.SessionRepository>()));
    gh.factory<_i21.CreateOrderBloc>(
        () => _i21.CreateOrderBloc(gh<_i18.MenuRepository>()));
    gh.factory<_i22.MenuBloc>(() => _i22.MenuBloc(gh<_i18.MenuRepository>()));
    return this;
  }
}

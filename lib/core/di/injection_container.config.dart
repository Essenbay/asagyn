// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../feat/auth/logic/auth_datasource.dart' as _i14;
import '../../feat/auth/logic/auth_repository.dart' as _i15;
import '../../feat/auth/pages/forgot_password/logic/forgot_password_bloc.dart'
    as _i18;
import '../../feat/menu/logic/create_order_bloc.dart' as _i22;
import '../../feat/menu/logic/menu_bloc.dart' as _i23;
import '../../feat/menu/logic/menu_repository.dart' as _i19;
import '../../feat/profilemenu/logic/fetch_profile_bloc.dart' as _i17;
import '../../feat/profilemenu/pages/my_sessions/logic/my_sessions_bloc.dart'
    as _i20;
import '../../feat/profilemenu/pages/profile_detail/logic/change_profile_bloc.dart'
    as _i16;
import '../../feat/session/logic/session_bloc.dart' as _i21;
import '../../feat/session/logic/session_repository.dart' as _i13;
import '../services/app_status/app_bloc.dart' as _i8;
import '../services/language_provder/language_cubit.dart' as _i10;
import '../services/network/interceptors/handler_interceptor.dart' as _i9;
import '../services/network/interceptors/network_log_interceptor.dart' as _i3;
import '../services/network/network_service.dart' as _i11;
import '../services/preference_service.dart' as _i4;
import '../services/secure_storage_service.dart' as _i6;

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
    gh.lazySingleton<_i3.NetworkLoggerInterceptor>(
        () => _i3.NetworkLoggerInterceptor());
    gh.singleton<_i4.PreferencesService>(
        _i4.PreferencesService(gh<_i5.SharedPreferences>()));
    gh.singleton<_i6.SecureStorage>(
        _i6.SecureStorage(gh<_i7.FlutterSecureStorage>()));
    gh.factory<_i8.AppBloc>(() => _i8.AppBloc(gh<_i6.SecureStorage>()));
    gh.lazySingleton<_i9.HandlerInterceptor>(
        () => _i9.HandlerInterceptor(gh<_i6.SecureStorage>()));
    gh.factory<_i10.LanguageCubit>(
        () => _i10.LanguageCubit(gh<_i4.PreferencesService>()));
    gh.singleton<_i11.NetworkService>(_i11.NetworkService(
      gh<_i12.Dio>(),
      gh<_i9.HandlerInterceptor>(),
      gh<_i3.NetworkLoggerInterceptor>(),
    ));
    gh.lazySingleton<_i13.SessionRepository>(() => _i13.SessionRepositoryImpl(
          service: gh<_i11.NetworkService>(),
          prefs: gh<_i4.PreferencesService>(),
        ));
    gh.lazySingleton<_i14.AuthDatasource>(
        () => _i14.AuthRepositoryImpl(network: gh<_i11.NetworkService>()));
    gh.lazySingleton<_i15.AuthRepository>(() => _i15.AuthRepositoryImpl(
          gh<_i6.SecureStorage>(),
          datasource: gh<_i14.AuthDatasource>(),
        ));
    gh.factory<_i16.ChangeProfileBloc>(
        () => _i16.ChangeProfileBloc(gh<_i15.AuthRepository>()));
    gh.factory<_i17.FetchProfileBloc>(
        () => _i17.FetchProfileBloc(gh<_i15.AuthRepository>()));
    gh.factory<_i18.ForgotPasswordBloc>(
        () => _i18.ForgotPasswordBloc(gh<_i15.AuthRepository>()));
    gh.lazySingleton<_i19.MenuRepository>(
        () => _i19.MenuRepositoryImpl(service: gh<_i11.NetworkService>()));
    gh.factory<_i20.MySessionsBloc>(
        () => _i20.MySessionsBloc(gh<_i13.SessionRepository>()));
    gh.factory<_i21.SessionBloc>(
        () => _i21.SessionBloc(gh<_i13.SessionRepository>()));
    gh.factory<_i22.CreateOrderBloc>(
        () => _i22.CreateOrderBloc(gh<_i19.MenuRepository>()));
    gh.factory<_i23.MenuBloc>(() => _i23.MenuBloc(gh<_i19.MenuRepository>()));
    return this;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i15;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../feat/auth/logic/auth_datasource.dart' as _i17;
import '../../feat/auth/logic/auth_repository.dart' as _i18;
import '../../feat/auth/pages/forgot_password/logic/forgot_password_bloc.dart'
    as _i20;
import '../../feat/menu/logic/create_order_bloc.dart' as _i23;
import '../../feat/menu/logic/menu_bloc.dart' as _i24;
import '../../feat/menu/logic/menu_repository.dart' as _i21;
import '../../feat/profilemenu/pages/my_sessions/logic/my_sessions_bloc.dart'
    as _i22;
import '../../feat/profilemenu/pages/profile_detail/logic/change_profile_bloc.dart'
    as _i19;
import '../../feat/session/logic/session_repository.dart' as _i16;
import '../services/app_status/app_bloc.dart' as _i11;
import '../services/language_provder/language_cubit.dart' as _i13;
import '../services/network/interceptors/handler_interceptor.dart' as _i12;
import '../services/network/interceptors/network_log_interceptor.dart' as _i3;
import '../services/network/network_service.dart' as _i14;
import '../services/preference_service.dart' as _i4;
import '../services/pusher/pusher_logger.dart' as _i6;
import '../services/pusher/pusher_service.dart' as _i7;
import '../services/secure_storage_service.dart' as _i9;

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
    gh.lazySingleton<_i6.PusherLogger>(() => _i6.PusherLogger());
    gh.lazySingleton<_i7.PusherService>(() => _i7.PusherService(
          gh<_i6.PusherLogger>(),
          gh<_i8.PusherChannelsFlutter>(),
        ));
    gh.singleton<_i9.SecureStorage>(
        _i9.SecureStorage(gh<_i10.FlutterSecureStorage>()));
    gh.factory<_i11.AppBloc>(() => _i11.AppBloc(
          gh<_i9.SecureStorage>(),
          gh<_i4.PreferencesService>(),
        ));
    gh.lazySingleton<_i12.HandlerInterceptor>(
        () => _i12.HandlerInterceptor(gh<_i9.SecureStorage>()));
    gh.factory<_i13.LanguageCubit>(
        () => _i13.LanguageCubit(gh<_i4.PreferencesService>()));
    gh.singleton<_i14.NetworkService>(_i14.NetworkService(
      gh<_i15.Dio>(),
      gh<_i12.HandlerInterceptor>(),
      gh<_i3.NetworkLoggerInterceptor>(),
    ));
    gh.lazySingleton<_i16.SessionRepository>(() => _i16.SessionRepositoryImpl(
          service: gh<_i14.NetworkService>(),
          prefs: gh<_i4.PreferencesService>(),
        ));
    gh.lazySingleton<_i17.AuthDatasource>(
        () => _i17.AuthRepositoryImpl(network: gh<_i14.NetworkService>()));
    gh.lazySingleton<_i18.AuthRepository>(() => _i18.AuthRepositoryImpl(
          gh<_i9.SecureStorage>(),
          datasource: gh<_i17.AuthDatasource>(),
        ));
    gh.factory<_i19.ChangeProfileBloc>(
        () => _i19.ChangeProfileBloc(gh<_i18.AuthRepository>()));
    gh.factory<_i20.ForgotPasswordBloc>(
        () => _i20.ForgotPasswordBloc(gh<_i18.AuthRepository>()));
    gh.lazySingleton<_i21.MenuRepository>(() => _i21.MenuRepositoryImpl(
          gh<_i4.PreferencesService>(),
          service: gh<_i14.NetworkService>(),
        ));
    gh.factory<_i22.MySessionsBloc>(
        () => _i22.MySessionsBloc(gh<_i16.SessionRepository>()));
    gh.factory<_i23.CreateOrderBloc>(
        () => _i23.CreateOrderBloc(gh<_i21.MenuRepository>()));
    gh.factory<_i24.MenuBloc>(() => _i24.MenuBloc(gh<_i21.MenuRepository>()));
    return this;
  }
}

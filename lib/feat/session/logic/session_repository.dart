import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/services/network/network_service.dart';
import 'package:zakazflow/core/services/preference_service.dart';
import 'package:zakazflow/feat/profilemenu/logic/profile_model.dart';
import 'package:zakazflow/feat/session/logic/models/establishment_model.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

abstract class SessionRepository {
  Future<Result<SessionModel?>> getSessionInfo();
  Future<Result<List<SessionModel>>> getSessions();
  Future<Result<SessionModel>> getSession(int id);
  Future<void> closeSession();
  Future<Result<List<OrderModel>>> getOrdersBySession(int sessionId);
  Future<Result<SessionModel>> createSession(String estabCode, String table);
  Future<Result<EstablishmentModel>> getEstablishmentInfo(String estabCode);
  Future<Result<void>> callWaiter(ProfileModel profile);
  Future<Result<void>> askSessionClosing(
      int sessionId, PaymentMethod paymentMethod);
}

@LazySingleton(as: SessionRepository)
class SessionRepositoryImpl implements SessionRepository {
  final NetworkService service;
  final PreferencesService prefs;

  SessionRepositoryImpl({required this.service, required this.prefs});

  @override
  Future<Result<SessionModel>> getSession(int id) async {
    final result = await service.request(
        request: (dio) => dio.get('/dining-session/${prefs.currentSessionId}'),
        fromJson: (json) {
          log(json.toString());
          return SessionModel.fromJson(json as Map<String, dynamic>);
        });
    return result;
  }

  @override
  Future<Result<SessionModel?>> getSessionInfo() async {
    if (prefs.currentSessionId == null) {
      return const Result.success(null);
    } else {
      return getSession(prefs.currentSessionId!);
    }
  }

  @override
  Future<Result<List<SessionModel>>> getSessions() async {
    return await service.request(
      request: (dio) => dio.get('/dining-session'),
      fromJson: (json) {
        json as List;
        return json
            .map((e) => SessionModel.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<Result<SessionModel>> createSession(
      String estabCode, String table) async {
    final result = await service.request(
      request: (dio) => dio.post('/dining-session/$estabCode'),
      fromJson: (json) {
        final result = SessionModel.fromJson(json as Map<String, dynamic>);
        prefs.setSessionInfo(result.id, table);
        return result;
      },
    );
    return result;
  }

  @override
  Future<Result<List<OrderModel>>> getOrdersBySession(int sessionId) async {
    final result = await service.request(
      request: (dio) => dio.get('/order/by-session/$sessionId'),
      fromJson: (json) {
        json as List;
        return json
            .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
    // log(result.mapOrNull(
    //         success: (data) => data.data
    //             .map((e) => e.orderItemDTOS.isNotEmpty)
    //             .contains(true)
    //             .toString()) ??
    //     '');
    return result;
  }

  @override
  Future<Result<EstablishmentModel>> getEstablishmentInfo(
      String estabCode) async {
    final result = await service.request(
      request: (dio) => dio.get('/establishment/$estabCode'),
      fromJson: (json) {
        return EstablishmentModel.fromJson(json as Map<String, dynamic>);
      },
    );
    return result;
  }

  @override
  Future<void> closeSession() async {
    await prefs.setSessionInfo(null, null);
  }

  @override
  Future<Result<void>> callWaiter(ProfileModel profile) async {
    final result = await service.request(
      request: (dio) => dio.get(
        '/order/call-waiter',
        data: {
          'code': prefs.currentSessionTable,
          'userDto': profile.toJson(),
        },
      ),
      fromJson: (json) {
        return null;
      },
    );
    return result;
  }

  @override
  Future<Result<void>> askSessionClosing(
      int sessionId, PaymentMethod paymentMethod) async {
    final data = paymentMethod.toJson();
    final result = await service.request(
      request: (dio) => dio.post(
        '/dining-session/close-session/$sessionId',
        data: data,
      ),
      fromJson: (json) {
        return null;
      },
    );
    return result;
  }
}

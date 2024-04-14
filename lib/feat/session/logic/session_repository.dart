import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/services/network/network_service.dart';
import 'package:zakazflow/core/services/preference_service.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

abstract class SessionRepository {
  Future<Result<SessionModel?>> getSessionInfo();
  Future<Result<List<SessionModel>>> getSessions();
  Future<Result<SessionModel>> getSession(int id);
  Future<Result<List<OrderModel>>> getOrdersBySession(int sessionId);
  Future<Result<SessionModel>> createSession(String estabCode);
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
        fromJson: (json) =>
            SessionModel.fromJson(json as Map<String, dynamic>));
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
            .map((e) => SessionModel.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<Result<SessionModel>> createSession(String estabCode) async {
    final result = await service.request(
      request: (dio) => dio.post('/dining-session/$estabCode'),
      fromJson: (json) {
        final result = SessionModel.fromJson(json as Map<String, dynamic>);
        prefs.setSessionId(result.id);
        return result;
      },
    );
    return result;
  }

  @override
  Future<Result<List<OrderModel>>> getOrdersBySession(int sessionId) async {
    final result = await service.request(
      request: (dio) => dio.post('/order/$sessionId'),
      fromJson: (json) {
        json as List;
        return json
            .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
    return result;
  }
}

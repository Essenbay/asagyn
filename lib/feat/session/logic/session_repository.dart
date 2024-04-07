import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/core/services/network/network_service.dart';
import 'package:zakazflow/feat/profilemenu/my_sessions/logic/session_preview_model.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

abstract class SessionRepository {
  Future<Result<SessionModel?>> getSessionInfo();
  Future<Result<List<SessionPreview>>> getSessions();
  Future<Result<SessionModel>> getSession(int id);
  Future<Result<SessionModel>> createSession();
}

@LazySingleton(as: SessionRepository)
class SessionRepositoryImpl implements SessionRepository {
  final NetworkService service;

  SessionRepositoryImpl({required this.service});

  @override
  Future<Result<SessionModel>> getSession(int id) {
    // TODO: implement getSession
    throw UnimplementedError();
  }

  @override
  Future<Result<SessionModel?>> getSessionInfo() async {
    return const Result.success(null);
  }

  @override
  Future<Result<List<SessionPreview>>> getSessions() {
    // TODO: implement getSessions
    throw UnimplementedError();
  }

  @override
  Future<Result<SessionModel>> createSession() async {
    final result = await service.request(
      request: (dio) => dio.post('/dining-session'),
      fromJson: (json) {
        return SessionModel.fromJson(json as Map<String, dynamic>);
      },
    );
    return result;
  }
}

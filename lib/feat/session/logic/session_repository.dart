import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/feat/profilemenu/my_sessions/logic/session_preview_model.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

abstract class SessionRepository {
  Future<Result<SessionModel?>> getSessionInfo();
  Future<Result<List<SessionPreview>>> getSessions();
  Future<Result<SessionModel>> getSession(int id);
}

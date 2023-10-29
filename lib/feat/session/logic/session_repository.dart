import 'package:zakazflow/core/services/network/models/result.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

abstract class SessionRepository {
  Future<Result<SessionModel?>> getSessionInfo();
}

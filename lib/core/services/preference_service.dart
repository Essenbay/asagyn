import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class PreferencesService {
  final SharedPreferences _prefs;

  static const String _languageCodeKey = 'languageCode';
  static const String _currentSessionIdKey = 'currentSessionId';
  static const String _currentSessionTableKey = 'currentSessionTable';

  String _languageCode = '';
  bool? _notficationIsPermitted;
  int? _currentSessionId;
  String? _currentSessionTable;

  String get languageCode => _languageCode;
  bool? get notificationPermitted => _notficationIsPermitted;
  int? get currentSessionId => _currentSessionId;
  String? get currentSessionTable => _currentSessionTable;

  PreferencesService(this._prefs) {
    _init();
  }

  Future<void> _init() async {
    _languageCode = _prefs.getString(_languageCodeKey) ?? 'ru';
    _currentSessionId = _prefs.getInt(_currentSessionIdKey);
    _currentSessionTable = _prefs.getString(_currentSessionTableKey);
  }

  Future<void> setLanguageCode(String value) async {
    await _prefs.setString(_languageCodeKey, value);
    _languageCode = value;
  }

  Future<void> setSessionInfo(int? sessionId, String? table) async {
    if (sessionId == null || table == null) {
      await _prefs.remove(_currentSessionIdKey);
      await _prefs.remove(_currentSessionTableKey);
    } else {
      await _prefs.setInt(_currentSessionIdKey, sessionId);
      await _prefs.setString(_currentSessionTableKey, table);
    }
    _currentSessionId = sessionId;
    _currentSessionTable = table;
  }
}

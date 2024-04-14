import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class PreferencesService {
  final SharedPreferences _prefs;

  static const String _languageCodeKey = 'languageCode';
  static const String _currentSessionIdKey = 'currentSessionId';

  String _languageCode = '';
  bool? _notficationIsPermitted;
  int? _currentSessionId;

  String get languageCode => _languageCode;
  bool? get notificationPermitted => _notficationIsPermitted;
  int? get currentSessionId => _currentSessionId;

  PreferencesService(this._prefs) {
    _init();
  }

  Future<void> _init() async {
    _languageCode = _prefs.getString(_languageCodeKey) ?? 'ru';
    _currentSessionId = _prefs.getInt(_currentSessionIdKey);
  }

  Future<void> setLanguageCode(String value) async {
    await _prefs.setString(_languageCodeKey, value);
    _languageCode = value;
  }

  Future<void> setSessionId(int value) async {
    await _prefs.setInt(_currentSessionIdKey, value);
    _currentSessionId = value;
  }
}

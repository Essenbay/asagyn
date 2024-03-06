import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class PreferencesService {
  final SharedPreferences _prefs;

  static const String _languageCodeKey = 'languageCode';

  String _languageCode = '';
  bool? _notficationIsPermitted;

  String get languageCode => _languageCode;
  bool? get notificationPermitted => _notficationIsPermitted;

  PreferencesService(this._prefs) {
    _init();
  }

  Future<void> _init() async {
    _languageCode = _prefs.getString(_languageCodeKey) ?? 'ru';
  }

  Future<void> setLanguageCode(String value) async {
    await _prefs.setString(_languageCodeKey, value);
    _languageCode = value;
  }
}

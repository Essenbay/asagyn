import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthStorage {
  final FlutterSecureStorage storage;

  AuthStorage(this.storage);

  static const String _tokenKeyKey = 'tokenKey';
  static const String _userIdKey = 'userId';
  String _tokenKey = '';
  int? _userId;

  String get tokenKey => _tokenKey;
  int? get userId => _userId;

  Future<void> init() async {
    _tokenKey = await storage.read(key: _tokenKeyKey) ?? '';
    _userId = int.tryParse(await storage.read(key: _userIdKey) ?? '');
  }

  Future<void> setUser(String token, int userId) async {
    await storage.write(key: _tokenKeyKey, value: token);
    _tokenKey = token;
    await storage.write(key: _userIdKey, value: userId.toString());
    _userId = userId;
  }

  Future<void> deleteUser() async {
    await storage.delete(key: _tokenKeyKey);
    _tokenKey = '';
    await storage.delete(key: _userIdKey);
    _userId = null;
  }
}

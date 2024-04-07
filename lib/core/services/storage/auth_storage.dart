import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthStorage {
  final FlutterSecureStorage storage;

  AuthStorage(this.storage);

  static const String _tokenKeyKey = 'tokenKey';
  String _tokenKey = '';

  String get tokenKey => _tokenKey;

  Future<void> init() async {
    _tokenKey = await storage.read(key: _tokenKeyKey) ?? '';
  }

  Future<void> setUser(String token) async {
    await storage.write(key: _tokenKeyKey, value: token);
    _tokenKey = token;
  }

  Future<void> deleteUser() async {
    await storage.delete(key: _tokenKeyKey);
    _tokenKey = '';
  }
}

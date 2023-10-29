import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class SecureStorage {
  final FlutterSecureStorage storage;
  final StreamController<String> _tokenChangeStream =
      StreamController<String>.broadcast();
  Stream<String> get tokenChangeStream => _tokenChangeStream.stream;

  SecureStorage(this.storage) {}
  static const String _tokenKeyKey = 'tokenKey';

  static String _tokenKey = '';

  Future<String> getTokenKey() async {
    if (_tokenKey.isNotEmpty) {
      return _tokenKey;
    } else {
      return await storage.read(key: _tokenKeyKey) ?? '';
    }
  }

  Future<void> setUser(String newToken) async {
    await storage.write(key: _tokenKeyKey, value: newToken);
    _tokenKey = newToken;
  }

  Future<void> deleteUser() async {
    await storage.delete(key: _tokenKeyKey);
    _tokenKey = '';
  }

  Future<void> dispose() async {
    await _tokenChangeStream.close();
  }
}

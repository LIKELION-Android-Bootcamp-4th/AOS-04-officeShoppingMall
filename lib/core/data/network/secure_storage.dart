import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Logger log = Logger();

  static Future<void> saveToken({required String accessToken, required String refreshToken}) async {
    await _storage.write(key: Api.accessToken, value: accessToken);
    await _storage.write(key: Api.refreshToken, value: refreshToken);
  }

  static Future<String?> loadAccessToken() async {
    return await _storage.read(key: Api.accessToken);
  }

  static Future<String?> loadRefreshToken() async {
    return await _storage.read(key: Api.refreshToken);
  }
  // TODO: 미사용 중 로그아웃 생긴다면 넣을 것
  static Future<void> clearTokens() async {
    _storage.delete(key: Api.accessToken);
    _storage.delete(key: Api.refreshToken);
  }
}

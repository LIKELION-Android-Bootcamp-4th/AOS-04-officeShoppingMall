import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/services/api_client.dart';

class AuthService {
  final Dio _dio = ApiClient.dio;

  Future<String> refreshAccessToken() async {
    try {
      final response = await _dio.post('/api/auth/refresh', data: {'refreshToken': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODVmNjlmYzQzOTkyMmMwOWMyMWFlZjMiLCJjb21wYW55SWQiOiI2ODVmNjlmYzQzOTkyMmMwOWMyMWFlZjAiLCJpc0FkbWluIjp0cnVlLCJpc1N1cGVyQWRtaW4iOnRydWUsImlhdCI6MTc1MTMzOTI2OCwiZXhwIjoxNzUxNDI1NjY4fQ.oRj5tVMltqCJ0Su_lVZy9PGiUyZ94NVFS4DnI4_Pc1w'});

      // 요청이 성공적이면 새 액세스 토큰 추출
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return data['accessToken'] as String;
      } else {
        throw Exception('토큰 발급 실패: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Refresh Token 이 유효하지 않으면 다시 로그인 시도 요청
      if (e.response?.statusCode == 401) {
        throw Exception('Refresh Token 이 유효하지 않음. 다시 로그인 필요');
      }
      rethrow;
    }
  }
}

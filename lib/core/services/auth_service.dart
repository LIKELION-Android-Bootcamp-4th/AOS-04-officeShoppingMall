import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/services/api_client.dart';

class AuthService {
  final Dio _dio = ApiClient.dio;

  Future<String> refreshAccessToken() async {
    try {
      final response = await _dio.post(
        ApiEndpoints.refreshToken,
        data: {
          'refreshToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODVmNjlmYzQzOTkyMmMwOWMyMWFlZjMiLCJjb21wYW55SWQiOiI2ODVmNjlmYzQzOTkyMmMwOWMyMWFlZjAiLCJpc0FkbWluIjp0cnVlLCJpc1N1cGVyQWRtaW4iOnRydWUsImlhdCI6MTc1MTMzOTI2OCwiZXhwIjoxNzUxNDI1NjY4fQ.oRj5tVMltqCJ0Su_lVZy9PGiUyZ94NVFS4DnI4_Pc1w',
        },
      );

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
      // 다시 로그인으로 연결
      rethrow;
    }
  }

  // 로그인
  Future<String> loginAction({required String email, required String password}) async {
    final response = await _dio.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] as Map<String, dynamic>;
      final accessToken = data['accessToken'] as String;
      return accessToken;
    } else if (response.statusCode == 400) {
      throw Exception("잘못된 요청");
    } else {
      throw Exception("인증 실패(이메일/비밀번호 불일치");
    }
  }

  // 회원가입
  Future<void> signupAction({
    required String email,
    required String password,
    required String nickname
  }) async {
    final response = await _dio.post(
      ApiEndpoints.signUp,
      data: {'email': email, 'password': password, 'nickName': nickname},
    );

    if(response.statusCode == 201){
      final data = response.data;
      final message = data['message'];
      print('가입 성공! $message');
    } else if(response.statusCode == 400){
      throw Exception("요청 형식이 잘못되었거나 중복된 이메일입니다.");
    }else if(response.statusCode == 409){
      throw Exception("이미 가입된 계정입니다.");
    }else{
      throw Exception("회원가입 실패! ${response.statusCode}");
    }
  }





}

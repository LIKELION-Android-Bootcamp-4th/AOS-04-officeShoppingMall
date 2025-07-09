import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/feature/auth/data/login_response.dart';
import 'package:office_shopping_mall/core/data/network/api_client.dart';
import 'login_request.dart';
import 'signup_request.dart';
import 'signup_response.dart';
import 'package:office_shopping_mall/core/data/network/secure_storage.dart';

class AuthService {
  final Dio _dio = ApiClient().dio;

  Future<String> refreshAccessToken() async {
    try {
      final refreshToken = await SecureStorage.loadRefreshToken();
      if (refreshToken == null) throw Exception('Refresh Token 없음. 다시 로그인 필요.');

      final response = await _dio.post(
        Api.auth.refreshToken,
        data: { Api.refreshToken: refreshToken},
      );

      // 요청이 성공적이면 새 액세스 토큰 추출
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final newAccessToken = data[Api.accessToken] as String?;
        if (newAccessToken == null) throw Exception('토큰 만료. 다시 로그인 필요');

        await SecureStorage.saveToken(accessToken: newAccessToken, refreshToken: refreshToken);

        return newAccessToken;
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
  Future<LoginResponse> loginAction({required LoginRequest requestData}) async {
    final response = await _dio.post(
      Api.auth.login,
      data: requestData.toJson(),
    );
    if (response.statusCode == 200) {
      final LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      print('로그인 성공! ${loginResponse.message}');

      final access = loginResponse.data.accessToken;
      final refresh = loginResponse.data.refreshToken;

      await SecureStorage.saveToken(accessToken: access, refreshToken: refresh);

      return loginResponse;
    } else if (response.statusCode == 400) {
      throw Exception("잘못된 요청");
    } else {
      throw Exception("인증 실패(이메일/비밀번호 불일치");
    }
  }

  // 회원가입
  Future<SignupResponse> signupAction({required SignupRequest requestData}) async {
    final response = await _dio.post(Api.auth.signUp, data: requestData.toJson());

    if (response.statusCode == 201) {
      final SignupResponse signupResponse = SignupResponse.fromJson(response.data);
      print('가입 성공! ${signupResponse.message}');
      return signupResponse;
    } else if (response.statusCode == 400) {
      throw Exception("요청 형식이 잘못되었거나 중복된 이메일입니다.");
    } else if (response.statusCode == 409) {
      throw Exception("이미 가입된 계정입니다.");
    } else {
      throw Exception("회원가입 실패! ${response.statusCode}");
    }
  }
}

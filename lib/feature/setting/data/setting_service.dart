import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/user_dto.dart';
import 'package:office_shopping_mall/core/data/network/api_client.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_request.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_response.dart';

class SettingService {
  final Dio _dio = ApiClient().dio;

  // 비밀번호 변경
  Future<PasswordSettingResponse> settingPassword({
    required PasswordSettingRequest requestData,
  }) async {
    try {
      final response = await _dio.patch(
        Api.mypage.updatePassword,
        data: requestData.toJson(),
      );
      if (response.statusCode == 200) {
        final PasswordSettingResponse pwSettingResponse =
            PasswordSettingResponse.fromJson(response.data);
        print('비밀번호 변경 성공! : ${pwSettingResponse.message}');
        return pwSettingResponse;
      } else {
        throw Exception("비밀번호 변경 실패 : ${response.statusCode}");
      }
    } on DioException catch (e) {
      print('DIO 에러 발생: ${e.message}');

      if (e.response != null && e.response!.data != null) {
        final int? statusCode = e.response?.statusCode;
        final PasswordSettingResponse errorResponse =
            PasswordSettingResponse.fromJson(e.response!.data);

        if (statusCode == 400) {
          print(
            '비밀번호 변경 실패(400: 유효성 검사 및 현재 비밀번호 불일치) : ${errorResponse.message}',);
          return errorResponse;
        } else if (statusCode == 401) {
          print('비밀번호 변경 실패(401: 인증 실패) : ${errorResponse.message}');
          return errorResponse;
        } else if (statusCode == 500) {
          print('비밀번호 변경 실패(500: 서버 오류) : ${errorResponse.message}');
          return errorResponse;
        } else {
          print('비밀번호 변경 실패 : ${errorResponse.message}');
          return errorResponse;
        }
      } else {
        print('네트워크 오류 또는 응답 데이터 없음: ${e.message}');
        return PasswordSettingResponse(
          success: false,
          message: '네트워크 오류 또는 응답 데이터 없음',
          timestamp: DateTime.now(),
          error: PasswordChangeFail(
            type: 'error',
            details: [e.message ?? '알 수 없는 네트워크 오류'],
          ),
        );
      }
    }
  }

  Future<UserDTO> fetchProfile() async {
    final response = await _dio.get(Api.mypage.getProfile);
    return UserDTO.fromJson(response.data['data']);
  }

  Future<UserDTO> updateProfile(UserDTO dto) async {
    final response = await _dio.patch(Api.mypage.updateProfile, data: dto.toJson());
    return UserDTO.fromJson(response.data['data']);
}
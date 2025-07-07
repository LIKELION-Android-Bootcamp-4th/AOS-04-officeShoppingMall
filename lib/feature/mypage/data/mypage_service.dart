import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/user_dto.dart';

class MypageService {
  final Dio _dio;

  MypageService(this._dio);

  Future<UserDTO> fetchUser() async {
    try {
      final response = await _dio.get(Api.mypage.getOrUpdateProfile);
      if (response.statusCode == 200) {
        return UserDTO.fromJson(response.data['data'] as Map<String, dynamic>);
      } else {
        throw Exception('error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}

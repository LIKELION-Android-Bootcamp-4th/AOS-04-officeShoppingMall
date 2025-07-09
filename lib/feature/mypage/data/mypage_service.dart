import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';

import '../../../core/data/models/dto/user_dto.dart';
import '../../../core/data/network/api_client.dart';

class MypageService {
  final Dio _dio = ApiClient().dio;

  // MypageService(this._dio);

  Future<UserDTO> fetchUser() async {
    try {
      final response = await _dio.get(Api.mypage.getProfile);
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

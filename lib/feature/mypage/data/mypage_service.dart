import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/user_dto.dart';

class MypageService {
  final Dio _dio = ApiClient().dio;

  Future<UserDTO> fetchUser() async {
    final response = await _dio.get(Api.mypage.getProfile);
    return UserDTO.fromJson(response.data['data']);
  }
}

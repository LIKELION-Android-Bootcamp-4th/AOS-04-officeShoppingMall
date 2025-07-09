import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/user_dto.dart';

class SettingService {
  final Dio _dio;

  SettingService(this._dio);

  Future<UserDTO> fetchProfile() async {
    final response = await _dio.get(Api.mypage.getProfile);
    return UserDTO.fromJson(response.data['data']);
  }

  Future<UserDTO> updateProfile(UserDTO dto) async {
    final response = await _dio.patch(Api.mypage.updateProfile, data: dto.toJson());
    return UserDTO.fromJson(response.data['data']);
  }
}
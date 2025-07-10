import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_request.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_response.dart';
import 'package:office_shopping_mall/feature/setting/data/setting_service.dart';

class SettingRepository {
  final SettingService _service;

  SettingRepository(this._service);

  Future<PasswordSettingResponse> changePassword({
    required PasswordSettingRequest requestData,
  }) async {
    try {
      final response = await _service.settingPassword(requestData: requestData);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getProfile() async {
    final dto = await _service.fetchProfile();
    return User.fromDTO(dto);
  }

  Future<User> saveProfile(User user) async {
    final dto = await _service.updateProfile(user.toDTO());
    return User.fromDTO(dto);
  }
}
import 'package:office_shopping_mall/feature/setting/data/setting_service.dart';
import '../data/pw_setting_request.dart';
import '../data/pw_setting_response.dart';

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

  //이 밑으로 추가
}

import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/feature/setting/data/setting_service.dart';

class SettingRepository {
  final SettingService _service;

  SettingRepository(this._service);

  Future<User> getProfile() async {
    final dto = await _service.fetchProfile();
    return User.fromDTO(dto);
  }

  Future<User> saveProfile(User user) async {
    final dto = await _service.updateProfile(user.toDTO());
    return User.fromDTO(dto);
  }
}
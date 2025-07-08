import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_request.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_response.dart';
import 'package:office_shopping_mall/feature/setting/domain/setting_repository.dart';

class SettingViewModel with ChangeNotifier {
  final SettingRepository _settingRepository;

  bool _isLoading = false;
  String? _error;
  PasswordSettingResponse? _passwordSettingResponse;

  bool get isLoading => _isLoading;

  String? get error => _error;

  PasswordSettingResponse? get passwordChangeResponse =>
      _passwordSettingResponse;

  SettingViewModel(this._settingRepository);

  Future<void> settingPassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    _isLoading = true; // 로딩 시작
    _error = null; // 이전 에러 메시지 초기화
    _passwordSettingResponse = null; // 이전 응답 초기화
    notifyListeners(); // UI에 로딩 상태 변경을 알림
    try {
      final request = PasswordSettingRequest
        (currentPassword: currentPassword,
          newPassword: newPassword,
          confirmPassword: confirmPassword
      );
      _passwordSettingResponse =
      await _settingRepository.changePassword(requestData: request);
      _error = null;
    } catch (e) {
      _error = "viewModel: 비밀번호 실패 : $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
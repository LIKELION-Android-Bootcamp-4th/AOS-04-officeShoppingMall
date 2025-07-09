import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/user_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_request.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_response.dart';
import 'package:office_shopping_mall/feature/setting/domain/setting_address.dart';
import 'package:office_shopping_mall/feature/setting/domain/setting_repository.dart';

class SettingViewModel extends ChangeNotifier {
  final SettingRepository _repository;

  User? _user;
  bool _isLoading = false;
  String? _error;
  List<SettingAddress> _addresses = [];
  PasswordSettingResponse? _passwordSettingResponse;

  SettingViewModel(this._repository) {
    loadProfile();
  }

  User? get user => _user;

  bool get isLoading => _isLoading;

  String? get error => _error;

  List<SettingAddress> get addresses => List.unmodifiable(_addresses);

  PasswordSettingResponse? get passwordChangeResponse =>
      _passwordSettingResponse;

  void addAddress(SettingAddress addr) {
    _addresses.add(addr);
    notifyListeners();
  }

  void removeAddress(SettingAddress addr) {
    _addresses.remove(addr);
    notifyListeners();
  }

  Future<void> loadProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _repository.getProfile();
    } catch (e) {
      _error = '$e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProfile(String? nickName, String? phone, Address? addr) async {
    if (_user == null) return;
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _repository.saveProfile(
        _user!.copyWith(nickName: nickName, phone: phone, address: addr),
      );
    } catch (e) {
      _error = '$e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

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
      await _repository.changePassword(requestData: request);
      _error = null;
    } catch (e) {
      _error = "viewModel: 비밀번호 실패 : $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

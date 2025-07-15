import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_request.dart';
import 'package:office_shopping_mall/feature/setting/data/pw_setting_response.dart';
import 'package:office_shopping_mall/feature/setting/data/setting_address.dart';
import 'package:office_shopping_mall/feature/setting/domain/setting_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingViewModel extends ChangeNotifier {
  static const _prefsKey = 'save_addr';

  final SettingRepository _repository;

  User? _user;
  bool _isLoading = false;
  String? _error;
  String? _uploadImageUrl;
  final List<SettingAddress> _addresses = [];
  PasswordSettingResponse? _passwordSettingResponse;

  SettingViewModel(this._repository) {
    _loadAddress();
    loadProfile();
  }

  User? get user => _user;

  bool get isLoading => _isLoading;

  String? get error => _error;

  String ? get uploadImageUrl => _uploadImageUrl;

  List<SettingAddress> get addresses => List.unmodifiable(_addresses);

  PasswordSettingResponse? get passwordChangeResponse => _passwordSettingResponse;

  Future<void> addAddress(SettingAddress addr) async {
    // 현재 추가한 주소가 기본 배송지로 설정될 경우
    if (addr.isDefault) {
      for (var address in _addresses) {
        address.isDefault = false;
      }
    }
    _addresses.add(addr);
    await _saveAddress();
    notifyListeners();
  }

  Future<void> removeAddress(SettingAddress addr) async {
    _addresses.remove(addr);
    await _saveAddress();
    notifyListeners();
  }

  Future<void> _loadAddress() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    if (raw != null) {
      try {
        final list = jsonDecode(raw) as List<dynamic>;
        _addresses
          ..clear()
          ..addAll(list.map((e) => SettingAddress.fromJson(e as Map<String, dynamic>)));
      } catch (_) {
        _addresses.clear();
      }
    }
    notifyListeners();
  }

  Future<void> _saveAddress() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(_addresses.map((a) => a.toJson()).toList());
    await prefs.setString(_prefsKey, raw);
  }

  SettingAddress getDefaultAddress() => _addresses.firstWhere((addr) => addr.isDefault);

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

  Future<void> updateProfile({
    required String? name,
    required String? phone,
    required String? addr,
    String? profileImagePath,
  }) async {
    if (_user == null) return;
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _repository.saveProfile(
        _user!.copyWith(name: name, phone: phone, addr: addr),
        profileImagePath: profileImagePath,
      );
      if (profileImagePath != null) _uploadImageUrl = _user?.profile.profileImage;
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
      final request = PasswordSettingRequest(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      _passwordSettingResponse = await _repository.changePassword(requestData: request);
      _error = null;
    } catch (e) {
      _error = "viewModel: 비밀번호 실패 : $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

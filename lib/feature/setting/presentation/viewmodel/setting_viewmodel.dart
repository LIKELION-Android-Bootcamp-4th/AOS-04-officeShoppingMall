import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/user_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/feature/setting/domain/setting_repository.dart';

class SettingViewModel extends ChangeNotifier {
  final SettingRepository _repository;

  User? _user;
  bool _isLoading = false;
  String? _error;

  SettingViewModel(this._repository) {
    loadProfile();
  }

  User? get user => _user;

  bool get isLoading => _isLoading;

  String? get error => _error;

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
          _user!.copyWith(nickName: nickName, phone: phone, address: addr)
      );
    } catch (e) {
      _error = '$e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

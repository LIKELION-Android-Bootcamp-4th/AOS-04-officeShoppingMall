import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/user_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/user.dart';
import 'package:office_shopping_mall/feature/mypage/domain/mypage_repository.dart';

class MypageViewModel extends ChangeNotifier {
  final MypageRepository _repository;

  User? _user;
  bool _isLoading = false;
  String? _error;

  MypageViewModel(this._repository);

  User? get user => _user;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> getUser() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _repository.getUser();
    } catch (e) {
      _error = '정보 로드 실패: $e';
    }
    _isLoading = false;
    notifyListeners();
  }
}

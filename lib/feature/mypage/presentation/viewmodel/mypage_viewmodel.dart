import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/user_dto.dart';
import 'package:office_shopping_mall/feature/mypage/domain/mypage_repository.dart';

class MypageViewModel extends ChangeNotifier {
  final MypageRepository _repository;

  UserDTO? userDTO;
  bool isLoading = false;
  String? error;

  MypageViewModel(this._repository);

  Future<void> getUser() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      userDTO = await _repository.getUser();
    } catch (e) {
      error = '정보 로드 실패: $e';
    }
    isLoading = false;
    notifyListeners();
  }
}

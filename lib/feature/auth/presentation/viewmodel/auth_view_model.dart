import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/auth/signup_request.dart';
import 'package:office_shopping_mall/core/data/models/auth/signup_response.dart';
import 'package:office_shopping_mall/feature/auth/domain/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepository _authRepository;

  bool _isLoading = false;
  String? _error;
  SignupResponse? _signupResponse;

  bool get isLoading => _isLoading;

  String? get error => _error;

  SignupResponse? get signupResponse => _signupResponse;

  //TODO: 로그인도 만들면 추가하기
  AuthViewModel(this._authRepository);

  Future<void> signUp({
    required String email,
    required String password,
    required String nickName,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final request = SignupRequest(
        email: email,
        password: password,
        nickName: nickName,
      );
      _signupResponse = await _authRepository.signUp(request);
      _error = null;
    } catch (e) {
      _error = "회원가입 실패 : $e";
    }
    _isLoading = false;
    notifyListeners();
  }
}

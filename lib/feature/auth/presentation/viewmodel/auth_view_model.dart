import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/auth/data/login_request.dart';
import 'package:office_shopping_mall/feature/auth/data/login_response.dart';
import 'package:office_shopping_mall/feature/auth/data/signup_request.dart';
import 'package:office_shopping_mall/feature/auth/data/signup_response.dart';
import 'package:office_shopping_mall/feature/auth/domain/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepository _authRepository;

  bool _isLoading = false;
  String? _error;
  SignupResponse? _signupResponse;
  LoginResponse? _loginResponse;

  bool get isLoading => _isLoading;

  String? get error => _error;

  SignupResponse? get signupResponse => _signupResponse;

  LoginResponse? get loginResponse => _loginResponse;

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
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final request = LoginRequest(email: email, password: password);
      _loginResponse = await _authRepository.logIn(request);
      _error = null;
    } catch (e) {
      _error = "로그인 실패 : $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logOut() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final success = await _authRepository.logOut();
      if (!success) _error = "알 수 없는 오류";
    } catch (e) {
      _error = "알 수 없는 오류: $e";
    }

    _isLoading = false;
    notifyListeners();
  }
}

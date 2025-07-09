import 'package:office_shopping_mall/feature/auth/data/login_request.dart';
import 'package:office_shopping_mall/feature/auth/data/login_response.dart';
import '../data/signup_request.dart';
import '../data/signup_response.dart';
import '../data/auth_service.dart';

class AuthRepository{
  final AuthService _service;

  AuthRepository(this._service);

  Future<SignupResponse> signUp(SignupRequest request) async {
    try {
      final response = await _service.signupAction(requestData: request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> logIn(LoginRequest request) async{
    try{
      final response = await _service.loginAction(requestData: request);
      return response;
    } catch (e){
      rethrow;
    }
  }

}
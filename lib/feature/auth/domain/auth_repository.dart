import 'package:office_shopping_mall/core/data/models/auth/login_request.dart';
import 'package:office_shopping_mall/core/data/models/auth/login_response.dart';
import '../../../core/data/models/auth/signup_request.dart';
import '../../../core/data/models/auth/signup_response.dart';
import '../data/auth_service.dart';

class AuthRepository{
  final AuthService _service;

  AuthRepository(this._service);

  @override
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
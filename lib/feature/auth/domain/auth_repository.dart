import 'package:office_shopping_mall/core/data/models/signup_response.dart';
import 'package:office_shopping_mall/feature/auth/data/auth_service.dart';

import '../../../core/data/models/signup_request.dart';

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
}
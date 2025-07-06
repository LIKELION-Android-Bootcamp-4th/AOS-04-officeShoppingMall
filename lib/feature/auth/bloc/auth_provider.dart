import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLogIn = false;

  bool get isLogIn => _isLogIn;

  void login() async {
    _isLogIn = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogIn', true);
    print('로그인 상태가 저장됨');
  }

  void logout() async {
    _isLogIn = false;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogIn', false);
  }
}

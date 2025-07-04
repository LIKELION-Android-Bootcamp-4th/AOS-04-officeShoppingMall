import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/auth/ui/login_screen.dart';
import 'package:office_shopping_mall/feature/auth/ui/signup_screen.dart';
import 'package:office_shopping_mall/feature/category/ui/category_screen.dart';
import 'package:office_shopping_mall/feature/home/ui/home_screen.dart';
import 'package:office_shopping_mall/feature/mypage/ui/mypage_screen.dart';
import 'package:office_shopping_mall/feature/preference/ui/preference_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.preference:
        return MaterialPageRoute(builder: (_) => PreferenceScreen());
      case AppRoutes.category:
        return MaterialPageRoute(builder: (_) => CategoryScreen());
      case AppRoutes.mypage:
        return MaterialPageRoute(builder: (_) => MypageScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text(AppConstants.pageNotFound))),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/auth/ui/login_screen.dart';
import 'package:office_shopping_mall/feature/auth/ui/signup_screen.dart';
import 'package:office_shopping_mall/feature/home/ui/home_screen.dart';
import 'package:office_shopping_mall/feature/mypage/ui/mypage_screen.dart';
import 'package:office_shopping_mall/feature/notification/ui/notification_screen.dart';
import 'package:office_shopping_mall/feature/order/ui/order_complete_screen.dart';
import 'package:office_shopping_mall/feature/order/ui/order_screen.dart';
import 'package:office_shopping_mall/feature/preference/ui/preference_screen.dart';
import 'package:office_shopping_mall/feature/setting/ui/pw_setting.dart';

import 'feature/category/ui/category_screen.dart';
import 'feature/product/ui/product_detail_screen.dart';
import 'feature/product/ui/product_list_screen.dart';
import 'package:office_shopping_mall/feature/cart/ui/cart_screen.dart';
import 'package:office_shopping_mall/feature/cart/ui/delivery_screen.dart';
import 'package:office_shopping_mall/feature/setting/ui/setting_screen.dart';
import 'package:office_shopping_mall/feature/search/ui/search_screen.dart';

import 'feature/review/ui/add_review_screen.dart';

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
      case AppRoutes.productList:
        return MaterialPageRoute(builder: (_) => ProductListScreen());
      case AppRoutes.productDetail:
        return MaterialPageRoute(builder: (_) => ProductDetailScreen());
      case AppRoutes.order:
        return MaterialPageRoute(builder: (_) => OrderScreen());
      case AppRoutes.orderComplete:
        return MaterialPageRoute(builder: (_) => OrderCompleteScreen());
      case AppRoutes.mypage:
        return MaterialPageRoute(builder: (_) => MypageScreen());
      case AppRoutes.setting:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case AppRoutes.notification:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case AppRoutes.delivery:
        return MaterialPageRoute(builder: (_) => DeliveryScreen());
      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case AppRoutes.pwSetting:
        return MaterialPageRoute(builder: (_) => PwSetting());
      case AppRoutes.addReview:
        return MaterialPageRoute(builder: (_) => AddReviewScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text(AppConstants.pageNotFound))),
        );
    }
  }
}

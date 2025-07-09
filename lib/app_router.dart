import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/cart/presentation/cart_main_screen.dart';
import 'package:office_shopping_mall/feature/home/presentation/home_screen.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/mypage_screen.dart';
import 'package:office_shopping_mall/feature/notification/presentation/notification_screen.dart';
import 'package:office_shopping_mall/feature/order/presentation/order_complete_screen.dart';
import 'package:office_shopping_mall/feature/order/presentation/order_screen.dart';
import 'package:office_shopping_mall/feature/preference/presentation/preference_screen.dart';
import 'package:office_shopping_mall/feature/review/presentation/review_screen.dart';
import 'package:office_shopping_mall/feature/setting/presentation/dest_setting_screen.dart';
import 'package:office_shopping_mall/feature/setting/presentation/widgets/pw_setting.dart';
import 'feature/category/presentation/category_screen.dart';
import 'feature/product/presentation/product_detail_screen.dart';
import 'feature/product/presentation/product_list_screen.dart';
import 'package:office_shopping_mall/feature/setting/presentation/setting_screen.dart';
import 'package:office_shopping_mall/feature/search/presentation/search_screen.dart';
import 'feature/auth/presentation/login_screen.dart';
import 'feature/auth/presentation/signup_screen.dart';
import 'feature/review/presentation/add_review_screen.dart';

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
        return MaterialPageRoute(builder: (_) => CartMainScreen(tabIndex: 0));
      case AppRoutes.orderPaid:
        return MaterialPageRoute(builder: (_) => CartMainScreen(tabIndex: 1));
      case AppRoutes.orderShipping:
        return MaterialPageRoute(builder: (_) => CartMainScreen(tabIndex: 2));
      case AppRoutes.orderDelivered:
        return MaterialPageRoute(builder: (_) => CartMainScreen(tabIndex: 3));
      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case AppRoutes.pwSetting:
        return MaterialPageRoute(builder: (_) => PwSetting());
      case AppRoutes.destSetting:
        return MaterialPageRoute(builder: (_) => DestSettingScreen());
      case AppRoutes.addReview:
        return MaterialPageRoute(builder: (_) => AddReviewScreen());
      case AppRoutes.review:
        return MaterialPageRoute(builder: (_) => ReviewScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text(AppConst.pageNotFound))),
        );
    }
  }
}

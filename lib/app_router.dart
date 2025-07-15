import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/cart/presentation/cart_main_screen.dart';
import 'package:office_shopping_mall/feature/home/presentation/home_screen.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/mypage_screen.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/widgets/mypage_recent_products.dart';
import 'package:office_shopping_mall/feature/notification/presentation/notification_screen.dart';
import 'package:office_shopping_mall/feature/order/presentation/order_detail_screen.dart';
import 'package:office_shopping_mall/feature/payment/payment_complete_screen.dart';
import 'package:office_shopping_mall/feature/payment/payment_screen.dart';
import 'package:office_shopping_mall/feature/preference/presentation/preference_screen.dart';
import 'package:office_shopping_mall/feature/review/presentation/review_screen.dart';
import 'package:office_shopping_mall/feature/setting/presentation/widgets/dest_setting.dart';
import 'package:office_shopping_mall/feature/setting/presentation/widgets/pw_setting.dart';
import 'feature/category/presentation/category_screen.dart';
import 'feature/product/presentation/product_detail_screen.dart';
import 'feature/product/presentation/product_list_screen.dart';
import 'package:office_shopping_mall/feature/setting/presentation/setting_screen.dart';
import 'package:office_shopping_mall/feature/search/presentation/search_screen.dart';
import 'feature/auth/presentation/login_screen.dart';
import 'feature/auth/presentation/signup_screen.dart';
import 'feature/review/presentation/add_review_screen.dart';
import 'feature/review/presentation/review_detail_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen(), settings: settings);
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => SignupScreen(), settings: settings);
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen(), settings: settings);
      case AppRoutes.preference:
        return MaterialPageRoute(builder: (_) => PreferenceScreen(), settings: settings);
      case AppRoutes.category:
        return MaterialPageRoute(builder: (_) => CategoryScreen(), settings: settings);
      case AppRoutes.productList:
        return MaterialPageRoute(builder: (_) => ProductListScreen(), settings: settings);
      case AppRoutes.productDetail:
        return MaterialPageRoute(builder: (_) => ProductDetailScreen(), settings: settings);
      case AppRoutes.order:
        return MaterialPageRoute(builder: (_) => PaymentScreen(), settings: settings);
      case AppRoutes.orderDetail:
        return MaterialPageRoute(builder: (_) => OrderDetailScreen(), settings: settings);
      case AppRoutes.orderComplete:
        return MaterialPageRoute(builder: (_) => PaymentCompleteScreen(), settings: settings);
      case AppRoutes.mypage:
        return MaterialPageRoute(builder: (_) => MypageScreen(), settings: settings);
      case AppRoutes.setting:
        return MaterialPageRoute(builder: (_) => SettingScreen(), settings: settings);
      case AppRoutes.notification:
        return MaterialPageRoute(builder: (_) => NotificationScreen(), settings: settings);
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (_) => CartMainScreen(tabIndex: 0), settings: settings);
      case AppRoutes.orderPaid:
        return MaterialPageRoute(builder: (_) => CartMainScreen(tabIndex: 1), settings: settings);
      case AppRoutes.orderShipping:
        return MaterialPageRoute(builder: (_) => CartMainScreen(tabIndex: 2), settings: settings);
      case AppRoutes.orderDelivered:
        return MaterialPageRoute(builder: (_) => CartMainScreen(tabIndex: 3), settings: settings);
      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => SearchScreen(), settings: settings);
      case AppRoutes.pwSetting:
        return MaterialPageRoute(builder: (_) => PwSetting(), settings: settings);
      case AppRoutes.destSetting:
        return MaterialPageRoute(builder: (_) => DestSettingScreen(), settings: settings);
      case AppRoutes.addReview:
        return MaterialPageRoute(builder: (_) => AddReviewScreen(), settings: settings);
      case AppRoutes.review:
        return MaterialPageRoute(builder: (_) => ReviewScreen(), settings: settings);
      case AppRoutes.reviewDetail:
        return MaterialPageRoute(builder: (_) => ReviewDetailScreen(), settings: settings);
      case AppRoutes.recentProd:
        return MaterialPageRoute(builder: (_) => MypageRecentProducts(), settings: settings);

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text(AppConst.err.pageNotFound))),
          settings: settings,
        );
    }
  }
}

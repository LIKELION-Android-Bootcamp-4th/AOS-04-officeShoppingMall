import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/utils/bottom_nav_observer.dart';
import 'package:office_shopping_mall/core/providers/bottom_nav_provider.dart';
import 'package:office_shopping_mall/feature/cart/cart_module.dart';
import 'package:office_shopping_mall/feature/home/home_module.dart';
import 'package:office_shopping_mall/feature/notification/notification_module.dart';
import 'package:office_shopping_mall/feature/order/order_module.dart';
import 'package:office_shopping_mall/feature/preference/preference_module.dart';
import 'package:office_shopping_mall/feature/product/product_module.dart';
import 'package:office_shopping_mall/feature/search/search_module.dart';
import 'package:office_shopping_mall/feature/setting/setting_module.dart';
import 'package:provider/provider.dart';
import 'app_router.dart';
import 'core/constants/app_routes.dart';
import 'core/data/network/api_client.dart';
import 'core/theme/theme.dart';
import 'feature/auth/auth_module.dart';
import 'feature/mypage/mypage_module.dart';
import 'feature/review/review_module.dart';

// 앱 전체서 Navigator 에 접근할 수 있도록 함
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const WalkinApp());
}

class WalkinApp extends StatelessWidget {
  const WalkinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(create: (_) => ApiClient().dio),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ...orderModule,
        ...preferenceModule,
        ...authModule,
        ...mypageModule,
        ...settingModule,
        ...searchModule,
        ...productModule,
        ...homeModule,
        ...cartModule,
        ...reviewModule,
        ...notificationModule,
      ],
      child: Consumer<BottomNavProvider>(
        builder: (context, nav, _) {
          return MaterialApp(
            title: AppConst.appName,
            theme: appThemeData(),
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRouter.onGenerateRoute,
            navigatorKey: navigatorKey,
            navigatorObservers: [BottomNavObserver(nav)],
          );
        },
      ),
    );
  }
}
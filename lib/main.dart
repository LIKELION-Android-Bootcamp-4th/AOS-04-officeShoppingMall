import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_provider.dart';
import 'package:office_shopping_mall/feature/cart/data/order_provider.dart';
import 'package:office_shopping_mall/feature/cart/data/product_provider.dart';
import 'package:office_shopping_mall/core/providers/bottom_nav_provider.dart';
import 'package:office_shopping_mall/feature/product/product_module.dart';
import 'package:office_shopping_mall/feature/setting/setting_module.dart';
import 'package:provider/provider.dart';
import 'app_router.dart';
import 'core/constants/app_routes.dart';
import 'core/data/network/api_client.dart';
import 'core/theme/theme.dart';
import 'feature/auth/auth_module.dart';
import 'feature/mypage/mypage_module.dart';

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
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ...mypageModule,
        ...authModule,
        ...settingModule,
        ...productModule,
      ],
      child: MaterialApp(
        title: AppConst.appName,
        theme: appThemeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
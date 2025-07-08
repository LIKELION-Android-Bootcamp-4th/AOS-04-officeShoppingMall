import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/feature/cart/data/product_provider.dart';
import 'package:office_shopping_mall/core/providers/bottom_nav_provider.dart';
import 'package:office_shopping_mall/feature/setting/setting_module.dart';
import 'package:provider/provider.dart';
import 'app_router.dart';
import 'core/constants/app_routes.dart';
import 'core/data/network/api_client.dart';
import 'core/theme/theme.dart';
import 'feature/auth/auth_module.dart';
import 'feature/mypage/mypage_module.dart';

void main() {
  runApp(const WalkinApp());
}

class WalkinApp extends StatelessWidget {
  const WalkinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(create: (_) => ApiClient.dio),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ...mypageModule,
        ...authModule,
        ...settingModule,
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        theme: appThemeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

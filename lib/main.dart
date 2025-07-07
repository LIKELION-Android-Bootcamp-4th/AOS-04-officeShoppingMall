import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/auth/data/auth_service.dart';
import 'package:office_shopping_mall/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:office_shopping_mall/core/data/network/api_client.dart';
import 'package:office_shopping_mall/feature/auth/data/auth_provider.dart';
import 'package:office_shopping_mall/feature/cart/data/product_provider.dart';
import 'package:office_shopping_mall/core/providers/bottom_nav_provider.dart';
import 'package:office_shopping_mall/feature/mypage/data/mypage_service.dart';
import 'package:office_shopping_mall/feature/mypage/domain/mypage_repository.dart';
import 'package:office_shopping_mall/feature/mypage/mypage_module.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/viewmodel/mypage_viewmodel.dart';
import 'package:provider/provider.dart';
import 'app_router.dart';
import 'core/constants/app_const.dart';
import 'core/constants/app_routes.dart';
import 'core/theme/theme.dart';

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
        ChangeNotifierProvider(create: (_) => AuthViewModel(AuthService())),
        ...mypageModule
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        theme: appThemeData(),
        debugShowCheckedModeBanner: false,
        //TODO: login으로 바꾸기
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

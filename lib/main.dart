import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/providers/bottom_nav_provider.dart';
import 'package:provider/provider.dart';
import 'app_router.dart';
import 'core/constants/app_constants.dart';
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
        ChangeNotifierProvider(create: (_) => BottomNavProvider(), child: WalkinApp(),),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        theme: appThemeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.productList,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: AppConstants.appName,
      theme: appThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

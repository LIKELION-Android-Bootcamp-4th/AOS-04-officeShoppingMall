import 'package:flutter/material.dart';

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
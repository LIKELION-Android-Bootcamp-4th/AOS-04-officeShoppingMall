import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/AppRouter.dart';
import 'package:office_shopping_mall/core/constants/app_colors.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MultiBlocProvider(
          providers: [],
          child: MaterialApp(
            title: AppConstants.appName,
            theme: ThemeData(primaryColor: AppColors.primaryColor),
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.home,
            onGenerateRoute: AppRouter.onGenerateRoute,
          ),
      ),
    );
  }
}
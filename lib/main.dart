import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/app_router.dart';
import 'package:office_shopping_mall/core/constants/app_colors.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/cart/data/product_provider.dart';
import'package:provider/provider.dart';

void main() {
  runApp(const WalkinApp());
}

class WalkinApp extends StatelessWidget {
  const WalkinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider(), ),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.delivery,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
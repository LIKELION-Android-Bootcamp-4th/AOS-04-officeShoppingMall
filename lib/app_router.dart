import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/cart/ui/cart_screen.dart';
import 'package:office_shopping_mall/feature/cart/ui/delivery_screen.dart';


class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {


      case AppRoutes.cart:
        return MaterialPageRoute(builder: (_) => CartScreen());
        break;

      case AppRoutes.delivery:
        return MaterialPageRoute(builder: (_) => DeliveryScreen());
        break;

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text(AppConstants.pageNotFound))),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/providers/bottom_nav_provider.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';

class BottomNavObserver extends NavigatorObserver {
  final BottomNavProvider nav;

  BottomNavObserver(this.nav);

  void _syncIndex(Route<dynamic>? route) {
    final name = route?.settings.name;

    switch (name) {
      case AppRoutes.category:
        nav.changeIndex(0);
        break;
      case AppRoutes.search:
        nav.changeIndex(1);
        break;
      case AppRoutes.home:
        nav.changeIndex(2);
        break;
      case AppRoutes.preference:
        nav.changeIndex(3);
        break;
      case AppRoutes.mypage:
        nav.changeIndex(4);
        break;

      default:
        // 5개의 탭이 아닌 다른 탭에서 바텀 내비가 뜬다면 아무것도 선택되지 않음
        nav.changeIndex(-1);
        break;
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _syncIndex(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _syncIndex(previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _syncIndex(newRoute);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/providers/bottom_nav_provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<BottomNavProvider>();
    final index = nav.currentIndex;

    // TODO: 추후 모든 루트가 생성되면 null 제거
    Widget navItem(String icon, int tabIndex, {String? route}) {
      final isSelected = index == tabIndex;
      return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          nav.changeIndex(tabIndex);
          if (route != null) {
            if (route == AppRoutes.home) {
              Navigator.pushNamedAndRemoveUntil(context, route, (_) => false);
            } else {
              Navigator.pushNamed(context, route);
            }
          }
        },
        icon: SvgPicture.asset('images/icon/$icon${isSelected ? '_1' : '_0'}.svg'),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SizedBox(
        height: 64,
        child: Card(
          elevation: 1.5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          clipBehavior: Clip.antiAlias, // 콘텐츠를 모서리에 맞춰 자름
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // TODO: 앱 루트 추가
              navItem('ic_nav_category', 0, route: AppRoutes.category),
              navItem('ic_nav_feed', 1),
              navItem('ic_nav_home', 2, route: AppRoutes.home),
              navItem('ic_nav_heart', 3, route: AppRoutes.preference),
              navItem('ic_nav_user', 4),
            ],
          ),
        ),
      ),
    );
  }
}

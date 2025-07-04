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
              IconButton(
                padding: EdgeInsets.zero, // 패딩을 없애야 원래 크기로 적용되어 사용
                icon: index == 0
                    ? SvgPicture.asset('images/icon/ic_nav_category_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_category_0.svg'),
                onPressed: () {
                  nav.changeIndex(0);
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: index == 1
                    ? SvgPicture.asset('images/icon/ic_nav_feed_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_feed_0.svg'),
                onPressed: () {
                  nav.changeIndex(1);
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: index == 2
                    ? SvgPicture.asset('images/icon/ic_nav_home_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_home_0.svg'),
                onPressed: () {
                  nav.changeIndex(2);
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: index == 3
                    ? SvgPicture.asset('images/icon/ic_nav_heart_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_heart_0.svg'),
                onPressed: () {
                  nav.changeIndex(3);
                  Navigator.pushNamed(context, AppRoutes.preference);
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: index == 4
                    ? SvgPicture.asset('images/icon/ic_nav_user_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_user_0.svg'),
                onPressed: () {
                  nav.changeIndex(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
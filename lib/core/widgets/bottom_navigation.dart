import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 2;

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                icon: _selectedIndex == 0
                    ? SvgPicture.asset('images/icon/ic_nav_category_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_category_0.svg'),
                onPressed: () {
                  onTap(0);
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: _selectedIndex == 1
                    ? SvgPicture.asset('images/icon/ic_nav_feed_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_feed_0.svg'),
                onPressed: () {
                  onTap(1);
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: _selectedIndex == 2
                    ? SvgPicture.asset('images/icon/ic_nav_home_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_home_0.svg'),
                onPressed: () {
                  onTap(2);
                  Navigator.pushNamed(context, AppRoutes.home);
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: _selectedIndex == 3
                    ? SvgPicture.asset('images/icon/ic_nav_heart_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_heart_0.svg'),
                onPressed: () {
                  onTap(3);
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: _selectedIndex == 4
                    ? SvgPicture.asset('images/icon/ic_nav_user_1.svg')
                    : SvgPicture.asset('images/icon/ic_nav_user_0.svg'),
                onPressed: () {
                  onTap(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/mypage/ui/mypage_content_menu_list.dart';
import 'package:office_shopping_mall/feature/mypage/ui/mypage_content_user_card.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '마이페이지', actions: [
        IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_setting.svg')),
        IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_cart.svg')),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MypageContentUserCard(),
          MypageContentMenuList(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

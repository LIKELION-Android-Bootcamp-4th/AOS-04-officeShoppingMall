import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/mypage/ui/mypage_content_menu_list.dart';
import 'package:office_shopping_mall/feature/mypage/ui/mypage_content_user_card.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '마이페이지',
        isLeading: false,
        actions: appBarActionsMypage(),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [MypageContentUserCard(), MypageContentMenuList()],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

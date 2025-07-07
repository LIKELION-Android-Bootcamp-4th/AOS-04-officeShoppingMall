import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/widgets/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/viewmodel/mypage_viewmodel.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/widgets/mypage_content_menu_list.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/widgets/mypage_content_user_card.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MypageViewModel>();
    return Scaffold(
      appBar: CustomAppBar(title: '마이페이지', actions: appBarActionsMypage()),
      body: Builder(
        builder: (context) {
          if (vm.isLoading) return Center(child: Text('임시'));
          if (vm.error != null) return Center(child: Text('에러:${vm.error.toString()}'));

          return ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [MypageContentUserCard(), MypageContentMenuList()],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

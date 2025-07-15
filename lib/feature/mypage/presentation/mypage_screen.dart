import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/viewmodel/mypage_viewmodel.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/widgets/mypage_content_user_card.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/widgets/mypage_content_menu_list.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MypageViewModel>();
    return Scaffold(
      appBar: CustomAppBar(title: '마이페이지', actions: appBarActionsMypage(), isLeading: false),
      body: Builder(
        builder: (context) {
          if (vm.isLoading) return Center(child: CustomCircleIndicator());
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

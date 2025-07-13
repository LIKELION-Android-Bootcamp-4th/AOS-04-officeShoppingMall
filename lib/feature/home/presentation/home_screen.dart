import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:office_shopping_mall/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:office_shopping_mall/feature/home/presentation/widgets/home_content_banner.dart';
import 'package:office_shopping_mall/feature/home/presentation/widgets/home_content_category.dart';
import 'package:office_shopping_mall/feature/home/presentation/widgets/home_content_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      extendBody: true, // 바텀 내비 뒤까지 확장
      appBar: CustomAppBar(
        actions: appBarActionsDefault(),
        titleTextStyle: Theme.of(context).textTheme.headlineLarge,
        isLeading: false,
      ),
      body: Builder(
        builder: (context) {
          if (vm.isLoading) return Center(child: CustomCircleIndicator());
          if (vm.error != null) return Center(child: Text(vm.error.toString()));

          return ListView(
            children: [
              HomeContentBanner(),
              const SizedBox(height: 20),

              categoryText('카테고리'),
              const SizedBox(height: 10),
              HomeContentCategory(),

              const SizedBox(height: 20),

              categoryText('현재 인기 상품'),
              const SizedBox(height: 10),
              HomeContentProducts(products: vm.popularProducts),
              const SizedBox(height: 20),


              // 새로운 추천 만들기
              // HomeContentProducts(),
              // HomeContentProducts(),
            ],
          );
        }
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

Widget categoryText(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Text(title, style: appTextTheme().headlineSmall),
  );
}

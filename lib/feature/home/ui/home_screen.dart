import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/home/ui/home_content_banner.dart';
import 'package:office_shopping_mall/feature/home/ui/home_content_category.dart';
import 'package:office_shopping_mall/feature/home/ui/home_content_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 바텀 내비 뒤까지 확장
      appBar: CustomAppBar(
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_search.svg')),
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_bell.svg')),
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_cart.svg')),
        ],
      ),
      body: ListView(
        children: [
          HomeContentBanner(),
          const SizedBox(height: 20),

          categoryText('카테고리'),
          const SizedBox(height: 10),

          HomeContentCategory(),
          const SizedBox(height: 20),

          categoryText('추천 상품 목록'),
          const SizedBox(height: 10),

          HomeContentProducts(),
        ],
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
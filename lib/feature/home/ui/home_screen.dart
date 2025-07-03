import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/services/api_client.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/home/ui/home_content_banner.dart';
import 'package:office_shopping_mall/feature/home/ui/home_content_category.dart';
import 'package:office_shopping_mall/feature/home/ui/home_content_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_search.svg')),
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_bell.svg')),
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_cart.svg')),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 80),
          children: [
            HomeContentBanner(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('카테고리', style: Theme.of(context).textTheme.headlineSmall),
            ),
            const SizedBox(height: 10),
            HomeContentCategory(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('추천 상품 목록', style: Theme.of(context).textTheme.headlineSmall),
            ),

            const SizedBox(height: 12),
            SizedBox(
              height: 260,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'images/banner${index + 1}.jpg',
                              width: 200,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Icon(Icons.favorite_border, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('상품명', style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 4),
                      Text('100,000원', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

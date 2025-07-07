import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/bottom_navigation.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/category/presentation/category_content_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        title: '카테고리',
        isLeading: false,
        actions: appBarActionsDefault(),
      ),
      body: CategoryContentList(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

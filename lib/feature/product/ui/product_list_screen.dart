import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/product/ui/product_list_content.dart';

import '../../../core/widgets/bottom_navigation.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      appBar: CustomAppBar(
        actions: appBarActionsDefault(),
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 20), ProductListContent()],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigation(),
    );
  }
}

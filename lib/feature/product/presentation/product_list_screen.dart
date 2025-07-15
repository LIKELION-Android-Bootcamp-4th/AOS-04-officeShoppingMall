import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_list_content.dart';

import '../../../core/widgets/bottom_navigation.dart';

class ProductListScreen extends StatelessWidget {
  final List<ProductDTO>? searchResults;

  const ProductListScreen({super.key, this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      appBar: CustomAppBar(actions: appBarActionsDefault()),

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

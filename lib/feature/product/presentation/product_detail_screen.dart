import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_detail_bottom.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_detail_content.dart';

import '../../../core/theme/app_colors.dart';
import 'viewmodel/product_viewmodel.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductViewModel>().selectedProduct;

    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        title: product?.name ?? '',
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        actions: appBarActionsNoBell(),
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                ProductDetailContent(),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.gray200,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: ProductDetailBottom(),
      ),
    );
  }
}

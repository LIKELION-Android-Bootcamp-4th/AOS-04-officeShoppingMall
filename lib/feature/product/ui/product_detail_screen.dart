import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/product/data/product.dart';
import 'package:office_shopping_mall/feature/product/ui/product_detail_bottom.dart';
import 'package:office_shopping_mall/feature/product/ui/product_detail_content.dart';

import '../../../core/theme/app_colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        title: products.firstWhere((element) => element.id == getSelectProductId()).productName,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_search.svg')),
          IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_cart.svg')),
        ],
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 20), ProductDetailContent()],
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 64,
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

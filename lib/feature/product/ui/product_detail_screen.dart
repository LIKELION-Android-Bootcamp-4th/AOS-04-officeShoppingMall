import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/feature/product/data/product.dart';
import 'package:office_shopping_mall/feature/product/ui/product_detail_content.dart';

import '../../../core/widgets/custom_app_bar.dart';


class ProductDetailScreen extends StatelessWidget{
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
        ]
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                ProductDetailContent(),
              ],
            ),
          ),
        ],
      ),
    );

  }


}
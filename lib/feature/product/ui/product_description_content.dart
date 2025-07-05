import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';

import '../data/product.dart';

Product productData = products.firstWhere((element) => element.id == getSelectProductId());

class ProductDescriptionContent extends StatelessWidget {
  const ProductDescriptionContent({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          width: double.infinity,

          constraints: BoxConstraints(
            minHeight: 200,
          ),

          padding: EdgeInsets.all(16),
          alignment: Alignment.topLeft,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.gray200,
            boxShadow: [
              BoxShadow(
                color: AppColors.gray200,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2)
              )
            ]
          ),

          child: Text(
            '상품 정보가 없습니다',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
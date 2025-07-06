import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/product/ui/product_content_container.dart';

import '../data/product.dart';

class ProductDescriptionContent extends StatelessWidget {
  const ProductDescriptionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductContentContainer(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: 200,
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
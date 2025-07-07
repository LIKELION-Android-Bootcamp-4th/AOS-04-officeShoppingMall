import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

class ProductDescriptionContent extends StatelessWidget {
  const ProductDescriptionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductContentContainer(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 200),
          child: Text('상품 정보가 없습니다', style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
    );
  }
}

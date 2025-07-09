import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

class ProductReviewContent extends StatelessWidget {
  const ProductReviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: ProductContentContainer(
            width: double.infinity,
            height: 120,
            child: Center(
              child: Text(
                '상품 후기글 보러가기',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

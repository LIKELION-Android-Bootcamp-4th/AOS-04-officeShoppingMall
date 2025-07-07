import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/product/ui/product_content_container.dart';
import 'package:provider/provider.dart';

import '../data/models/product.dart';
import '../data/product_viewmodel.dart';

class ProductDescriptionContent extends StatelessWidget {
  const ProductDescriptionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final Product? _product = context.watch<ProductDataProvider>().selectedProduct as Product?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductContentContainer(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 200),
          child: _product?.description == null ? Text("상품 데이터를 불러올 수 없습니다") : Text(_product!.description ?? ""),
        ),
      ],
    );
  }
}

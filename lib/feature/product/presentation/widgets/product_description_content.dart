import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';
import 'package:provider/provider.dart';
import '../../../../core/data/models/dto/product.dart';
import '../viewmodel/product_viewmodel.dart';



class ProductDescriptionContent extends StatelessWidget {
  const ProductDescriptionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductDataViewModel>().selectedProduct;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductContentContainer(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 200),
          child: product?.description == null
              ? Text("상품 데이터를 불러올 수 없습니다")
              : Text(product!.description ?? ""),
        ),
      ],
    );
  }
}

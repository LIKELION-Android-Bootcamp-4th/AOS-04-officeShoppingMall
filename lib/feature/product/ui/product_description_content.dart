import 'package:flutter/material.dart';

import '../data/product.dart';

class ProductDescriptionContent extends StatelessWidget {
  final Product product;

  const ProductDescriptionContent({super.key, required this.product,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),

        ),

        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),

              Text(
                product.description ?? '상품 정보가 없습니다',
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ]
        )
      ]
    );
  }
}
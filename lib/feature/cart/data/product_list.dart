import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/cart/data/product.dart';
import 'package:office_shopping_mall/feature/cart/data/product_list_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index){
        return ProductListItem(product: products[index]);
      },
    );
  }
}
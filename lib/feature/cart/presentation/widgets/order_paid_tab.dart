import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/cart/data/product_list.dart';
import 'package:office_shopping_mall/feature/cart/data/product_provider.dart';

class OrderPaidTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OrderPaidTabState();
  }
}

class OrderPaidTabState extends State<OrderPaidTab> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ProductList(
          products: context
              .watch<ProductProvider>()
              .products
              .where((a) => a.productDeliveryIndex == 1)
              .toList(),
        ),
      ),
    );
  }
}
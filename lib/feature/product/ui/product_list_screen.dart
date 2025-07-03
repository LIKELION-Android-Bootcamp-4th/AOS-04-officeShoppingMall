import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/product/ui/product_list_content.dart';


class ProductListScreen extends StatelessWidget{
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ProductListContent()
          ],
        ),
      ),
    );
  }


}
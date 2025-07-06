import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/product/ui/order_content.dart';

import '../../../core/theme/app_colors.dart';
import '../data/product.dart';


class OrderScreen extends StatelessWidget{
  const OrderScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final product = getSelectedProductData();

    return Scaffold(
      extendBody: true,

      appBar: CustomAppBar(
        title: "결제",
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                OrderContent(),
              ],
            ),
          ],
        ),
      ),


      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.gray200,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, -1),
            )
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '결제 금액',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '${product?.price}원',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            )




          ]
        ),

      ),

    );



  }

}
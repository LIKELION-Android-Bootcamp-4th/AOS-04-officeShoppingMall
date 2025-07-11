import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import '../../../core/data/models/dto/product_dto.dart';
import '../../product/presentation/viewmodel/product_viewmodel.dart';
import 'package:office_shopping_mall/feature/order/presentation/widgets/order_bottom.dart';
import 'package:office_shopping_mall/feature/order/presentation/widgets/order_content.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final ProductDTO? product = context.select((ProductDataViewModel vm) => vm.selectedProduct) as ProductDTO?;

    return Scaffold(
      extendBody: true,

      appBar: CustomAppBar(title: "결제", titleTextStyle: Theme.of(context).textTheme.titleLarge),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 20), OrderContent()],
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
            ),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 16),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('결제 금액', style: Theme.of(context).textTheme.titleLarge),
                  Text('${product?.price}원', style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),

            OrderBottom(
              onSelected: () async {
                if (product == null) return;

                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("결제"),
                    content: Text("결제 하시겠습니까?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("취소"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("확인"),
                      ),
                    ],
                  ),
                );

                if (confirm == true) {
                  Navigator.pushNamed(context, AppRoutes.orderComplete);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

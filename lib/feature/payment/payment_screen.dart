import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:office_shopping_mall/feature/payment/domain/order_info.dart';
import 'package:office_shopping_mall/feature/payment/presentaion/widgets/payment_content.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_viewmodel.dart';
import 'package:office_shopping_mall/feature/payment/presentaion/widgets/payment_bottom.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderInfo? _orderInfo;

  @override
  Widget build(BuildContext context) {
    final Product product = context.select((ProductViewModel vm) => vm.selectedProduct!);

    return Scaffold(
      extendBody: true,

      appBar: CustomAppBar(title: "결제", titleTextStyle: Theme.of(context).textTheme.titleLarge),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: OrderContent(
          product: product,
          onChanged: (info) => setState(() => _orderInfo = info),
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
                  Text('결제 금액', style: Theme.of(context).textTheme.titleMedium),
                  Text(product.price.toWon, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),

            OrderBottom(
              onSelected: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    if (_orderInfo?.paymentMethod == null) {
                      return AlertDialog(
                        content: Text("결제 방식을 선택해 주세요."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text("확인"),
                          ),
                        ],
                      );
                    }
                    return AlertDialog(
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
                    );
                  }
                );

                if (confirm == true) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(child: CustomCircleIndicator()),
                  );
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRoutes.orderComplete, arguments: _orderInfo);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

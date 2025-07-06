import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';

import '../../../core/constants/app_routes.dart';
import '../data/product.dart';


class OrderBottom extends StatefulWidget{
  const OrderBottom({super.key});

  @override
  State<OrderBottom> createState() => _OrderBottom();

}

class _OrderBottom extends State<OrderBottom> {

  void _onBuyPressed() {
    final product = getSelectedProductData();
    if (product == null) return;

    Navigator.pushNamed(
      context,
      AppRoutes.order,
      arguments: product,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),


        child: SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.zero,

              child: Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(32),
                  onTap: _onBuyPressed,
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text(
                      '결제',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),

            )
        )

    );
  }

}
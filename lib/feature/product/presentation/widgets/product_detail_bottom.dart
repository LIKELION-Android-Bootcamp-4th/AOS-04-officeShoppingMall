import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/product/ui/product_button.dart';

import '../../../core/constants/app_routes.dart';
import '../data/models/product.dart';
import 'package:office_shopping_mall/feature/product/data/product.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_button.dart';

class ProductDetailBottom extends StatefulWidget {
  const ProductDetailBottom({super.key});

  @override
  State<ProductDetailBottom> createState() => _ProductDetailBottom();
}

class _ProductDetailBottom extends State<ProductDetailBottom> {
  bool isFavorite = false;

  void _onFavoritePressed() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _onCartPressed() {}

  void _onBuyPressed() {
    Navigator.pushNamed(context, AppRoutes.order);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: _onFavoritePressed,
              child: SizedBox(
                height: double.infinity,
                child: SvgPicture.asset(
                  isFavorite
                      ? 'images/icon/ic_heart_large_1.svg'
                      : 'images/icon/ic_heart_large_0.svg',
                ),
              ),
            ),

            SizedBox(width: 12),

            ProductButton(
              width: 128,
              height: 48,
              text: '장바구니',
              backgroundColor: AppColors.gray100,
              textColor: Colors.black,
              onPressed: _onCartPressed,
              borderRadius: 60,
              isExpanded: true,
              flex: 1,
            ),

            SizedBox(width: 8),

            ProductButton(
              width: 200,
              height: 48,
              text: '구매하기',
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              onPressed: _onBuyPressed,
              borderRadius: 60,
              isExpanded: true,
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/cart/presentation/viewmodel/cart_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_button.dart';

class ProductDetailBottom extends StatefulWidget {
  const ProductDetailBottom({super.key});

  @override
  State<ProductDetailBottom> createState() => _ProductDetailBottom();
}

class _ProductDetailBottom extends State<ProductDetailBottom> {
  void _onCartPressed({
    required String productId,
    required int? quantity,
    required int unitPrice
  }) {
    context.read<CartViewModel>().addToCart(
      productId: productId,
      quantity: quantity ?? 1,
      unitPrice: unitPrice,
    );
  }

  void _onBuyPressed() {
    Navigator.pushNamed(context, AppRoutes.order);
  }

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductViewModel>().selectedProduct;
    if (product == null) {
      return const SizedBox(height: 60);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () {
                context.read<ProductViewModel>().toggleFavorite(product);
              },
              child: SizedBox(
                height: double.infinity,
                child: SvgPicture.asset(
                  product.isFavorite
                      ? 'images/icon/ic_heart_large_1.svg'
                      : 'images/icon/ic_heart_large_0.svg',
                ),
              ),
            ),

            SizedBox(width: 12),

            Expanded(
              child: ProductButton(
                text: '장바구니',
                backgroundColor: AppColors.gray100,
                textColor: Colors.black,
                onPressed: () {
                  _onCartPressed(
                    productId: product.id,
                    quantity: 1,
                    unitPrice: product.price,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('상품을 장바구니에 추가했습니다.'),
                      action: SnackBarAction(
                        label: '보러가기',
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.cart);
                        },
                      ),
                    ),
                  );
                },
                borderRadius: 60,
              ),
            ),

            SizedBox(width: 8),

            Expanded(
              child: ProductButton(
                text: '구매하기',
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
                onPressed: _onBuyPressed,
                borderRadius: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

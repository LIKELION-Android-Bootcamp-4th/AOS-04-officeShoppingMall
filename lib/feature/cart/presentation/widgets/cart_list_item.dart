import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_Item_response.dart';
import 'package:office_shopping_mall/feature/cart/presentation/viewmodel/cart_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_viewmodel.dart';

class CartListItem extends StatelessWidget {
  final CartItemResponse cart;
  final int index;

  CartListItem({super.key, required this.cart, required this.index});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CartViewModel>();

    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: viewModel.isSelected(cart.id),
            onChanged: (bool? checked) => viewModel.toggleCarts(cart.id),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.only(top: 16,left: 16, bottom: 16),
            width: MediaQuery.of(context).size.width * 0.84,
            decoration: BoxDecoration(
              color: appColorScheme().surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                context.read<ProductViewModel>().getProductById(cart.product.id);
                Navigator.pushNamed(context, AppRoutes.productDetail);
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Card(
                        elevation: 0,
                        clipBehavior: Clip.antiAlias,
                        child: cart.product.thumbnailImage != null
                            ? Image.network(
                          cart.product.thumbnailImage!.url,
                          fit: BoxFit.cover,
                          width: 90,
                          height: 90,
                        )
                            : Container(
                          color: AppColors.gray200,
                          alignment: Alignment.center,
                          width: 90,
                          height: 90,
                          child: Text(
                            '상품 이미지가 없습니다',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 160,
                                  child: Text(
                                    cart.product.name,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    viewModel.deleteCart(cart.id);
                                  },
                                  icon: SvgPicture.asset('images/icon/ic_close.svg'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${cart.quantity} 개",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  cart.totalPrice.toWon,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(width: 16,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
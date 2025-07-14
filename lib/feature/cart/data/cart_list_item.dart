import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:office_shopping_mall/core/data/models/dto/cart_dto.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/cart/presentation/viewmodel/cart_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/presentation/product_detail_screen.dart';

class CartListItem extends StatelessWidget {
  final CartDTO cart;
  final int index;

  CartListItem({super.key, required this.cart, required this.index});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CartViewModel>();
    final carts = context.watch<CartViewModel>().carts;

    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: viewModel.isSelected(cart.cartId),
            onChanged: (bool? checked) => viewModel.toggleCarts(cart.cartId),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width * 0.84,
            height: 200,
            decoration: BoxDecoration(
              color: appColorScheme().surfaceContainerLow,
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductDetailScreen()),
                );
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.7),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {viewModel.deleteCart(cart.cartId);},
                          icon: SvgPicture.asset('images/icon/ic_close.svg'),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 130,
                          child: cart.product.thumbnailImage == null
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.gray200,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '상품 이미지가 없습니다',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ),
                                )
                              : PageView.builder(
                                  itemCount: cart.product.images.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            cart.product.images[index],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.product.name,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              SizedBox(height: 3),
                              Text(
                                "2개",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    carts[index].product.price.toWon,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

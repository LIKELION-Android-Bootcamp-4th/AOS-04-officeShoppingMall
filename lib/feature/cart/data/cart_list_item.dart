import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/data/models/dto/cart_dto.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_provider.dart';
import 'package:office_shopping_mall/feature/product/presentation/product_detail_screen.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatelessWidget {
  final CartDTO cart;

  CartListItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: false,
            onChanged: (bool? checked) {
              print("체크박스 클릭");
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width * 0.84,
            height: 190,
            decoration: BoxDecoration(
              color: appColorScheme().surfaceContainerLow,
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductDetailScreen(),)
                );
              },
              // TODO: 전체 수정 필요
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * 0.7,),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              Provider.of<CartProvider>(
                                context,
                                listen: false,
                              ).removeCart(cart);
                            },
                            icon: SvgPicture.asset(
                              'images/icon/ic_close.svg',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Container(
                            width: 86,
                            height: 86,
                            margin: EdgeInsets.only(top: 6, left: 5),
                            decoration: BoxDecoration(
                              color: appColorScheme().surfaceContainer,
                              borderRadius: BorderRadiusGeometry.circular(10),
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                cart.product.name,
                                style: Theme.of(context).textTheme.titleSmall
                            ),
                            SizedBox(height: 3),
                            Text("2개", style: TextStyle(fontSize: 15)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.48,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 3),
                                    child: Text(
                                        "100,000",
                                        style: Theme.of(context).textTheme.titleSmall
                                    ),
                                  ),
                                  Text("원", style: Theme.of(context).textTheme.bodyMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
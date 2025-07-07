import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/cart/data/product.dart';
import 'package:office_shopping_mall/feature/cart/data/product_provider.dart';
import 'package:office_shopping_mall/feature/cart/ui/order_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          product.productDeliveryIndex == 0
              ? //체크박스. 장바구니 탭에서만 활성화
                Checkbox(
                  value: false,
                  onChanged: (bool? checked) {
                    print("체크박스 클릭");
                  },
                )
              : SizedBox(width: MediaQuery.of(context).size.width * 0.04),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: product.productDeliveryIndex == 0
                ? MediaQuery.of(context).size.width * 0.84
                : MediaQuery.of(context).size.width * 0.92,
            height: 190,
            decoration: BoxDecoration(
              color: appColorScheme().surfaceContainerLow,
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  product.productDeliveryIndex == 0
                      // TODO: 추후 수정 필요
                      ? MaterialPageRoute(
                          builder: (_) => OrderDetailScreen(),
                        ) //장바구니에 담긴 상품은 상품 상세페이지로
                      : MaterialPageRoute(
                          builder: (_) => OrderDetailScreen(),
                        ), //결제 완료~배송 완료 상품은 주문 내역으로
                );
              },
              // TODO: 전체 수정 필요
              child: SizedBox(
                child: Column(
                  children: [
                    product.productDeliveryIndex == 0
                        ? //지우기 버튼. 장바구니 탭에서만 활성화
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width * 0.7,),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    Provider.of<ProductProvider>(
                                      context,
                                      listen: false,
                                    ).deleteProduct(product);
                                  },
                                  icon: SvgPicture.asset(
                                    'images/icon/ic_close.svg',
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(height: 48),

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
                              product.productName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text("2개", style: TextStyle(fontSize: 15)),
                            Container(
                              width: product.productDeliveryIndex == 0
                                  ? MediaQuery.of(context).size.width * 0.48
                                  : MediaQuery.of(context).size.width * 0.56,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 3),
                                    child: Text(
                                      "100,000",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text("원", style: TextStyle(fontSize: 15)),
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

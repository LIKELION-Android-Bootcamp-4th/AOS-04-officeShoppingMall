import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/feature/cart/data/product.dart';
import 'package:office_shopping_mall/feature/cart/data/product_list.dart';
import 'package:office_shopping_mall/feature/cart/ui/order_detail_screen.dart';
import 'package:office_shopping_mall/feature/cart/data/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListItem extends StatelessWidget {
  final int index;
  // Product productID;
  const ProductListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 360,
        height: 190,
        decoration: BoxDecoration(
          color: Color(0x4DD9D9D9),
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OrderDetailScreen(),),
            );
          },
          child: SizedBox(
            child: Column(
              children: [
                index == 0 ?  //체크박스, 지우기 버튼. 장바구니 탭에서만 활성화
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Checkbox(
                        value: false,
                        onChanged: (bool? checked){
                          print("체크박스 누름!");
                        },
                      ),
                    ),
                    SizedBox(width: 250,),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: (){
                          //Provider.of<Product>(context, listen: false).deleteProduct(productID);
                        },
                        icon: SvgPicture.asset('images/icon/ic_close.svg'),
                      ),
                    ),
                  ],
                )
                : SizedBox(height: 48,),

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        width: 86,
                        height: 86,
                        margin: EdgeInsets.only(top:6, left: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
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
                          "상품명",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          "2개",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Container(
                            width: 220,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 3),
                                  child: Text("100,000", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                                ),
                                Text("원", style: TextStyle(fontSize: 15,),),
                              ],
                            )
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
    );
  }
}
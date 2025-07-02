import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/cart/data/product_list.dart';
import 'package:office_shopping_mall/feature/cart/ui/CartScreen.dart';
import 'package:office_shopping_mall/feature/cart/ui/OrderDetailScreen.dart';
import 'package:office_shopping_mall/feature/cart/ui/delivery_navigation.dart';

class DeliveryScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DeliveryScreenState();
  }
}

class DeliveryScreenState extends State<DeliveryScreen> with SingleTickerProviderStateMixin{
  int _selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          // IconButton(onPressed: (){}
          //   icon: SvgPicture.asset('images/icon/ic_back.svg')
          // ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DeliveryNavigation(
            selectIndex: _selectIndex,
            onTap: (index){
              setState(() {
                _selectIndex = index;
              });
            }
          ),

          Expanded(
              child: IndexedStack(
                index: _selectIndex,
                children: [
                  CartScreen(),  //장바구니 이동

                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                          color: Color(0xFFD9D9D9),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => OrderDetailScreen(),),
                              );
                            },
                            child: SizedBox(
                              width: 359,
                              height: 132,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                                      color: Color(0x4DD9D9D9),
                                      child: SizedBox(
                                        width: 86,
                                        height: 86,
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
                                        Text(
                                          "옵션입니다",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SizedBox(width: 120),

                                            Text(
                                              "100,000",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 7,),
                                            Text(
                                              "원",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                  //ProductList(model.product_id),
                  Text("배송 중입니다.. 기다려주세요"),
                  Text("리뷰 작성 합시다~")
                ],
              )),
        ],
      ),
    );
  }
}
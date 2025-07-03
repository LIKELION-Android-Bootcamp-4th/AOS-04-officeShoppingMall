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
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          },
          icon: SvgPicture.asset('images/icon/ic_back.svg')
        ),
        title: _selectIndex == 0 ? Text("장바구니", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
            : Text("주문 내역", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
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

                    //상품 목록 틀만.. 나중에 다른 파일로 이동 예정
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 360,
                            height: 132,
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
                                    // Align(
                                    //   alignment: Alignment.center,
                                    //   child: IconButton(
                                    //     onPressed: (){},
                                    //     icon: SvgPicture.asset('images/icon/ic_close.svg'),
                                    //   ),
                                    // ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16),
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
                                              "옵션입니다",
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
                         ),
                      ],
                    ),
                    //ProductList(model.product_id),
                    Text("배송 중입니다.. 기다려주세요"),
                    Text("리뷰 작성 합시다~")
                 ],
                )
            ),
          ],
      ),
    );
  }
}
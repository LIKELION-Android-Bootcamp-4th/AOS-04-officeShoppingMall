import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/feature/cart/data/product_list.dart';
import 'package:office_shopping_mall/feature/cart/data/product_list_item.dart';
import 'package:office_shopping_mall/feature/cart/ui/caet_screen.dart';
import 'package:office_shopping_mall/feature/cart/ui/order_detail_screen.dart';
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

                    //상품 목록
                    ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index){
                        return ProductListItem(
                          index: _selectIndex
                        );
                      },
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
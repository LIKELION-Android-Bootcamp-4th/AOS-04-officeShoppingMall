import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';

class CartScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CartScreenState();
  }
}

class CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("장바구니 탭 입니다"),
        ],
      ),

      //금액~결제 버튼
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFD9D9D9),
                  width: 1,
                ),
              ),
            ),
              child: SizedBox(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            "결제 금액",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: 16,),
                          child: Text(
                            "100,000",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 7,),
                        Padding(
                          padding: EdgeInsets.only(top: 16, right: 16),
                          child: Text(
                            "원",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed:(){
                          print("press button");
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(379, 56),
                          backgroundColor: Color(0xFF2E77D6),
                        ),
                        child: Text(
                          "결제",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
      ),
    );
  }
}
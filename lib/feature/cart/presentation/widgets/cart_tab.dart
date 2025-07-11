import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_list_item.dart';
import 'package:office_shopping_mall/feature/cart/presentation/viewmodel/cart_viewmodel.dart';
import 'package:provider/provider.dart';

class CartTab extends StatefulWidget {

  @override
  State<CartTab> createState() => CartTabState();
}

class CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    final carts = context.watch<CartViewModel>().carts;

    return Scaffold(
      body: ListView.builder(
          itemCount: carts.length,
          itemBuilder: (context, index){
        return CartListItem(cart: carts[index]);
      }),

      //금액~결제 버튼
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xFFD9D9D9), width: 1)),
          ),
          child: Container(
            color: Colors.white,
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text("결제 금액", style: TextStyle(fontSize: 20)),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        "100,000",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 7),
                    Padding(
                      padding: EdgeInsets.only(top: 16, right: 16),
                      child: Text("원", style: TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      print("go to OrderScreen");
                    },
                    child: Text(
                      "결제",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

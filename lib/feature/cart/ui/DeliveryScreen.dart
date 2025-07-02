import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/cart/ui/CartScreen.dart';
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
                  CartScreen(),
                ],
              ))
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/cart/ui/DeliveryScreen.dart';

main() =>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeliveryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
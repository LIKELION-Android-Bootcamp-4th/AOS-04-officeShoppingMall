import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/order/presentation/order_list_screen.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_list_viewmodel.dart';

class OrderShippingTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OrderShippingTabState();
  }
}

class OrderShippingTabState extends State<OrderShippingTab> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    context.read<OrderListViewModel>().loadOrders();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: OrderListScreen(
          orders: context
              .watch<OrderListViewModel>()
              .orders
              .where((a) => a.status == 'shipped')
              .toList(),
        ),
      ),
    );
  }
}
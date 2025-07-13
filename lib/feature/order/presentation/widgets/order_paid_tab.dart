import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/order/data/order_list.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_viewmodel.dart';

class OrderPaidTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OrderPaidTabState();
  }
}

class OrderPaidTabState extends State<OrderPaidTab> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    context.read<OrderViewModel>().loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: OrderList(
          orders: context
              .watch<OrderViewModel>()
              .orders
              .where((a) => a.orderIndex == 1)
              .toList(),
        ),
      ),
    );
  }
}
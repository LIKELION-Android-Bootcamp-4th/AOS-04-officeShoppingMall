import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/cart/presentation/viewmodel/cart_viewmodel.dart';
import 'package:office_shopping_mall/feature/cart/presentation/widgets/cart_tab.dart';
import 'package:office_shopping_mall/feature/cart/presentation/widgets/cart_tab_bar.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_list_viewmodel.dart';
import 'package:office_shopping_mall/feature/order/presentation/widgets/order_delivered_tab.dart';
import 'package:office_shopping_mall/feature/order/presentation/widgets/order_paid_tab.dart';
import 'package:office_shopping_mall/feature/order/presentation/widgets/order_shipping_tab.dart';

class CartMainScreen extends StatefulWidget {
  final int tabIndex;

  const CartMainScreen({super.key, required this.tabIndex});

  @override
  State<StatefulWidget> createState() => _CartMainScreenState();
}

class _CartMainScreenState extends State<CartMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.tabIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartsLength = context.watch<CartViewModel>().carts.length;
    final orders = context.watch<OrderListViewModel>().orders;

    return Scaffold(
      appBar: CustomAppBar(title: widget.tabIndex == 0 ? '장바구니' : '주문내역'),
      body: Column(
        children: [
          CartTabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$cartsLength',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('장바구니', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),

              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${orders.where((a) => a.status == 'pending').length}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('결제 완료', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${orders.where((a) => a.status == 'shipped').length}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('배송 중', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${orders.where((a) => a.status == 'delivered').length}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('배송 완료', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CartTab(),
                OrderPaidTab(),
                OrderShippingTab(),
                OrderDeliveredTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

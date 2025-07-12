import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/order/presentation/order_detail_screen.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_viewmodel.dart';

class OrderListItem extends StatelessWidget {
  final OrderDTO order;
  final int index;

  const OrderListItem({super.key, required this.order, required this.index});

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrderViewModel>().orders;

    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.04),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width * 0.92,
            height: 190,
            decoration: BoxDecoration(
              color: appColorScheme().surfaceContainerLow,
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailScreen(index: index)
                  ), //결제 완료~배송 완료 상품은 주문 내역으로
                );
              },
              // TODO: 전체 수정 필요
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(height: 48),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Container(
                            width: 86,
                            height: 86,
                            margin: EdgeInsets.only(top: 6, left: 5),
                            decoration: BoxDecoration(
                              color: appColorScheme().surfaceContainer,
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
                              order.product.name,
                              style: Theme.of(context).textTheme.titleSmall
                            ),
                            SizedBox(height: 3),
                            Text("2개", style: Theme.of(context).textTheme.titleMedium),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.56,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 3),
                                    child: Text(
                                        '${orders[index].product.price}원',
                                      style: Theme.of(context).textTheme.titleSmall
                                    ),
                                  ),
                                ],
                              ),
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
        ],
      ),
    );
  }
}
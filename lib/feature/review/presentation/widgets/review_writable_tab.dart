import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/cart/data/order_list.dart';
import 'package:office_shopping_mall/feature/cart/data/order_provider.dart';
import 'package:office_shopping_mall/feature/review/presentation/add_review_screen.dart';

class ReviewWritableTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          OrderList(
            orders: context
                .watch<OrderProvider>()
                .orders
                .where((a) => a.orderIndex == 3)
                .toList(),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              color: Color(0x4DD9D9D9),
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddReviewScreen()), //리뷰 작성 페이지로 이동
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text("리뷰 작성", style: TextStyle(fontSize: 20),),
                )
            ),
          ),
        ],
      ),
    );
  }
}

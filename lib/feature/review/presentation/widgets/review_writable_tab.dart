import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/order/data/order_list.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_viewmodel.dart';
import 'package:office_shopping_mall/feature/review/presentation/add_review_screen.dart';

class ReviewWritableTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderIndex3 = context.watch<OrderViewModel>().orders.where((a) => a.orderIndex == 3).toList();
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          OrderList(
            orders: orderIndex3
          ),
          orderIndex3.isNotEmpty ?
          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerColor,
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
                  child: Text('리뷰 작성', style: Theme.of(context).textTheme.bodyLarge),
                )
            ),
          ):
          Text('작성 가능한 리뷰가 없습니다.', style: Theme.of(context).textTheme.bodyLarge,)
        ],
      ),
    );
  }
}

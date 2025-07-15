import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/order/presentation/order_list_screen.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_list_viewmodel.dart';
import 'package:office_shopping_mall/feature/review/presentation/add_review_screen.dart';

import '../../../product/presentation/widgets/product_content_container.dart';

class ReviewWritableTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderDelivered = context
        .watch<OrderListViewModel>()
        .orders
        .where((a) => a.status == 'delivered')
        .toList();

    if (orderDelivered.isEmpty) {
      return Center(child: Text('작성할 수 있는 리뷰가 없습니다.'));
    }

    return ListView.builder(
      itemCount: orderDelivered.length,
      itemBuilder: (context, index) {
        final order = orderDelivered[index];
        final product = null;

        return ProductContentContainer(
          width: double.infinity,
          child: Row(
            children: [
              // 이미지 카드
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: product?.thumbnailImage != null
                    ? Image.network(
                  product!.thumbnailImage!.url,
                  fit: BoxFit.fill,
                  width: 86,
                  height: 86,
                )
                    : Container(
                  color: AppColors.gray200,
                  alignment: Alignment.center,
                  width: 86,
                  height: 86,
                  child: Text(
                    '상품 이미지가 없습니다',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // 상품 정보
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product?.name ?? '',
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product?.price.toWon ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
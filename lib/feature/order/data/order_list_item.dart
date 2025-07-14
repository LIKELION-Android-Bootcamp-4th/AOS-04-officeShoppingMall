import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/order/presentation/order_detail_screen.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_viewmodel.dart';
import 'package:office_shopping_mall/feature/review/presentation/review_detail_screen.dart';

class OrderListItem extends StatelessWidget {
  final OrderDTO order;
  final int index;

  const OrderListItem({super.key, required this.order, required this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width * 0.92,
            height: 156,
            decoration: BoxDecoration(
              color: appColorScheme().surfaceContainerLow,
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailScreen(index: index),
                  ),
                );
              },

              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      height: 130,
                      child: order.product.thumbnailImage == null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.gray200,
                              ),
                              child: Center(
                                child: Text(
                                  '상품 이미지가 없습니다',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            )
                          : PageView.builder(
                              itemCount: order.product.images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        order.product.images[index],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),

                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.product.name,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(height: 3),
                          Text(
                            "2개",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                '${NumberFormat('#,###').format(order.product.price)}원',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
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

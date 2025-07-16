import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/order/presentation/order_list_screen.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_list_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_viewmodel.dart';
import 'package:office_shopping_mall/feature/review/presentation/add_review_screen.dart';

import '../../../product/presentation/widgets/product_content_container.dart';
import '../viewmodel/review_model.dart';

class ReviewWritableTab extends StatefulWidget {

  @override
  State<ReviewWritableTab> createState() => _ReviewWritableTabState();
}

class _ReviewWritableTabState extends State<ReviewWritableTab> {
  @override
  void initState() {
    super.initState();
    // 주문 데이터 로드
    Future.microtask(() {
      context.read<OrderListViewModel>().loadOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final orders = context
        .watch<OrderListViewModel>()
        .orders;


    // 배송 완료 주문만 필터
    final deliveredOrders = orders.where((a) => a.status == 'pending').toList();

    final writableItems = deliveredOrders
        .expand((order) => order.items)
        .where((item) => item.review == null)
        .toList();

    if (writableItems.isEmpty) {
      return Center(child: Text('작성할 수 있는 리뷰가 없습니다.'));
    }

    return ListView.builder(
      itemCount: writableItems.length,
      itemBuilder: (context, index) {
        final product = writableItems[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
        child: GestureDetector(
          onTap: () async {
            final productId = product.productId;
            final productVM = context.read<ProductViewModel>();

            context.read<ReviewModel>().productId = productId;
            await productVM.getProductById(productId);
            context.read<ReviewModel>().selectedProduct = productVM.selectedProduct;

            Navigator.pushNamed(context, AppRoutes.addReview);
          },
          child: ProductContentContainer(
            width: double.infinity,
            child: Row(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: product.thumbnailImageUrl.isNotEmpty
                      ? Image.network(
                    product.thumbnailImageUrl,
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
                      '상품 이미지 없음',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${product.unitPrice.toWon}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        );
      },
    );
  }
}
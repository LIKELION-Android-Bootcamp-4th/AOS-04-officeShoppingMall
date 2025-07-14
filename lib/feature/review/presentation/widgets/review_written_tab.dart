import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/data/models/dto/review_dto.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';
import 'package:office_shopping_mall/feature/review/presentation/widgets/review_item.dart';
import 'package:office_shopping_mall/feature/review/presentation/widgets/review_written_item.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../viewmodel/review_model.dart';

class ReviewWrittenTab extends StatefulWidget {
  const ReviewWrittenTab({super.key});

  @override
  State<ReviewWrittenTab> createState() => _ReviewWrittenTabState();
}

class _ReviewWrittenTabState extends State<ReviewWrittenTab> {
  late ReviewModel vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<ReviewModel>();
    vm.getMyReview();
  }

  @override
  Widget build(BuildContext context) {
    vm = context.watch<ReviewModel>();

    if (vm.isLoading) {
      Center(child: CustomCircleIndicator());
    }

    if (vm.reviews.isEmpty) {
      return Center(child: Text('작성한 리뷰가 없습니다.'));
    }

    return ListView.builder(

      itemCount: vm.reviews.length,
      itemBuilder: (context, index) {
        final ReviewDTO review = vm.reviews[index];
        final product = review.product;

        return ProductContentContainer(
          width: double.infinity,
          child: Column(
            children: [

              Row(
                children: [
                  // 이미지 영역
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

                  // 상품 정보 영역
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
                        SvgPicture.asset(""),
                        Text(
                          "${product?.score}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // 리뷰 본문
              ReviewItem(review: review),

            ],
          ),
        );
      },
    );
  }
}
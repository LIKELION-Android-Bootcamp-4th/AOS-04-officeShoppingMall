import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

import '../../../../core/data/models/dto/review_dto.dart';
import '../../../../core/data/models/entity/user.dart';
import '../../../../core/theme/theme.dart';
import '../../../mypage/presentation/viewmodel/mypage_viewmodel.dart';
import '../viewmodel/review_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

import '../../../../core/data/models/dto/review_dto.dart';
import '../viewmodel/review_model.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});

  final ReviewDTO review;

  @override
  Widget build(BuildContext context) {
    return ProductContentContainer(
      width: double.infinity,

      color: AppColors.gray200,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 별점
        Text(
          "${review.rating}점",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        // 후기 내용
        Text(
          review.comment.isEmpty ? "내용이 없습니다." : review.comment,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        // 이미지
        if (review.images != null && review.images!.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var image in review.images!) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      image.url,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 2),
                ],
              ],
            ),
          )
      ],
      ),
    );
  }
}
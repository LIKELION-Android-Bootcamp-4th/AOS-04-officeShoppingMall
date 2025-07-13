import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

import '../../../../core/data/models/dto/review_dto.dart';
import '../../../../core/data/models/entity/user.dart';
import '../../../../core/theme/theme.dart';
import '../../../mypage/presentation/viewmodel/mypage_viewmodel.dart';
import '../viewmodel/review_model.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});

  final ReviewDTO review;

  @override
  Widget build(BuildContext context) {
    var vm = context.read<ReviewModel>();

    return GestureDetector(
      onTap: () {
        vm.selectedReview = review;
        Navigator.pushNamed(context, AppRoutes.reviewDetail);
      },
      child: ProductContentContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(""),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          review.userId,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        review.rating.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    review.comment.isEmpty ? "내용이 없습니다." : review.comment,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
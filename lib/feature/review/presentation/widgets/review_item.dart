import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

import '../../../../core/data/models/dto/review_dto.dart';
import '../../../../core/data/models/entity/user.dart';
import '../../../../core/theme/theme.dart';
import '../../../mypage/presentation/viewmodel/mypage_viewmodel.dart';
import '../viewmodel/review_model.dart';

class ReviewItem extends StatelessWidget{
  const ReviewItem({super.key, required this.review, required this.user});

  final ReviewDTO review;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ProductContentContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: appColorScheme().surfaceContainerHigh,
              radius: 32,
              foregroundImage: AssetImage(
                user.profile.profileImage != null
                    ? 'images/default_profile.jpg'
                    : user.profile.profileImage!,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        user.nickName,
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 12),
                      Text(
                        review.rating.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    review.comment.isEmpty ? "내용이 없습니다." : review.comment,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
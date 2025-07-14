import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/data/models/dto/review_dto.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';
import 'package:office_shopping_mall/feature/review/presentation/widgets/review_item.dart';
import 'package:office_shopping_mall/feature/review/presentation/widgets/review_written_item.dart';

import '../../../../core/constants/app_routes.dart';
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

    if (vm.reviews.isEmpty) {
      return const Center(child: Text('작성한 리뷰가 없습니다.'));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vm.reviews.length,
      itemBuilder: (context, index) {
        final ReviewDTO review = vm.reviews[index];
        return ProductContentContainer(
          width: double.infinity,
          child: Column(
            children: [

              ReviewItem(review: review),
              SizedBox(height: 16),

            ],
          )
        );
      },
    );
  }
}
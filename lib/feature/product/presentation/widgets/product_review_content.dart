import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_button.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

import '../../../../core/data/models/entity/user.dart';
import '../../../mypage/presentation/viewmodel/mypage_viewmodel.dart';
import '../../../review/presentation/viewmodel/review_model.dart';
import '../../../review/presentation/widgets/review_item.dart';
import '../viewmodel/product_viewmodel.dart';

class ProductReviewContent extends StatefulWidget {
  const ProductReviewContent({super.key});

  @override
  State<ProductReviewContent> createState() => _ProductReviewContentState();
}

class _ProductReviewContentState extends State<ProductReviewContent> {
  late ReviewModel reviewModel;
  late Product? product;

  @override
  void initState() {
    super.initState();
    reviewModel = context.read<ReviewModel>();
    product = context.read<ProductViewModel>().selectedProduct;
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ReviewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductContentContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(vm.isLoading == true)
                Center(child: CustomCircleIndicator())
              else if (vm.reviews.isEmpty)
                Center(child: Text("리뷰가 없습니다."))
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: vm.reviews.length,
                  itemBuilder: (context, index) {
                    final review = vm.reviews[index];
                    return ReviewItem(review: review);
                  },
                ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
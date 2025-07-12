import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

import '../../../../core/data/models/entity/user.dart';
import '../../../mypage/presentation/viewmodel/mypage_viewmodel.dart';
import '../../../review/presentation/viewmodel/review_model.dart';
import '../../../review/presentation/widgets/review_item.dart';
import '../viewmodel/product_viewmodel.dart';

class ProductReviewContent extends StatefulWidget {
  const ProductReviewContent({super.key});

  @override
  State<ProductReviewContent> createState() => _ProductReviewContent();

}

class _ProductReviewContent extends State<ProductReviewContent> {
  late ReviewModel vm;
  late ProductDTO? product;
  late User? user;

  @override
  void initState() {
    super.initState();
    vm = context.read<ReviewModel>();
    product = context.read<ProductViewModel>().selectedProduct;
    user = context.read<MypageViewModel>().user;
    if (product != null) {
      vm.getReviews(product!.id);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductContentContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: vm.reviews.length,
                itemBuilder: (context, index) {
                  final review = vm.reviews[index];
                  return ReviewItem(review: review, user: user!);
                }
              )
            ]
          )
        )
      ],
    );
  }
}

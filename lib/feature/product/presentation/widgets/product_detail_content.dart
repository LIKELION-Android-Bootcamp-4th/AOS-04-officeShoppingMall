import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_button.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_description_content.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_review_content.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_tab.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../review/presentation/viewmodel/review_model.dart';
import '../viewmodel/product_viewmodel.dart';

class ProductDetailContent extends StatefulWidget {
  const ProductDetailContent({super.key});

  @override
  State<ProductDetailContent> createState() => _ProductDetailContent();
}

class _ProductDetailContent extends State<ProductDetailContent> {
  int _selectedTabIndex = 0;
  late ProductViewModel vm;

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    vm = context.read<ProductViewModel>();
    if(vm.selectedProduct != null) {
      context.read<ReviewModel>().getReviews(vm.selectedProduct!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductViewModel>().selectedProduct;

    if (vm.isLoading) {
      return Center(child: CustomCircleIndicator());
    }

    if (product == null) {
      return Center(child: Text("상품 데이터를 불러올 수 없습니다"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        SizedBox(
          height: 228,
          child: product.thumbnailImage == null
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
              : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(product.thumbnailImage!.url),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(product.name, style: Theme.of(context).textTheme.titleLarge),
            Text(
              product.price.toWon,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            SvgPicture.asset("images/icon/ic_star_small_1.svg"),
            SizedBox(width: 4),
            Text(
              "${context.read<ReviewModel>().productScore}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProductTab(
              tabs: ['상세 설명', '리뷰'],
              selectedIndex: _selectedTabIndex,
              onTabSelected: _selectTab,
            ),
          ],
        ),
        SizedBox(height: 20),
        if (_selectedTabIndex == 0)
          ProductDescriptionContent()
        else if (_selectedTabIndex == 1)
          ProductReviewContent(),

      ],
    );
  }
}
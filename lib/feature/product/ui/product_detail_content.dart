import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/product/data/product.dart';
import 'package:office_shopping_mall/feature/product/ui/product_description_content.dart';
import 'package:office_shopping_mall/feature/product/ui/product_review_content.dart';
import 'package:office_shopping_mall/feature/product/ui/product_tab.dart';

class ProductDetailContent extends StatefulWidget {
  const ProductDetailContent({super.key});

  @override
  State<ProductDetailContent> createState() => _ProductDetailContent();
}

class _ProductDetailContent extends State<ProductDetailContent> {
  int _selectedTabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = getSelectedProductData();

    if (product == null) {
      return Center(child: Text("상품 데이터를 불러올 수 없습니다"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 228,
          child: product.imageUrl == null
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
                  itemCount: product.imageUrl!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(product.imageUrl![index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.productName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '${product.price}원',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        SizedBox(height: 4),
        GestureDetector(
          onTap: () {},
          child: Text(
            "${product.categoryInfo?.keys.toString() ?? ''} / ${product.categoryInfo?.values.toString() ?? ''}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
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

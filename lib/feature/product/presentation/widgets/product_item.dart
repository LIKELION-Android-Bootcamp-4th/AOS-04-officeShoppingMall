import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/preference/presentation/viewmodel/preference_viewmodel.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_list_viewmodel.dart';
import '../../../../core/constants/app_routes.dart';
import '../viewmodel/product_viewmodel.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItem();
}

class _ProductItem extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        await context.read<ProductViewModel>().setSelectedProduct(product);
        Navigator.pushNamed(context, AppRoutes.productDetail);
      },
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 180,
              child: Stack(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: product.thumbnailImage?.url != null
                        ? Image.network(
                            product.thumbnailImage!.url,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          )
                        : Container(
                            color: AppColors.gray200,
                            alignment: Alignment.center,
                            child: Text(
                              '상품 이미지가 없습니다',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 14,
                    child: GestureDetector(
                      onTap: () {
                        context.read<ProductListViewModel>().toggleFavorite(product);
                        context.read<PreferenceViewModel>().loadFavorites();
                      },
                      behavior: HitTestBehavior.translucent,
                      child: SvgPicture.asset(
                        product.isFavorite
                            ? 'images/icon/ic_heart_small_1.svg'
                            : 'images/icon/ic_heart_small_0.svg',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 60,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Text(product.price.toWon, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

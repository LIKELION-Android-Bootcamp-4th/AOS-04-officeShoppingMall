import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/app_router.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';

import '../../../core/constants/app_routes.dart';
import '../data/product.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItem();
}

class _ProductItem extends State<ProductItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.isFavorite;
  }

  void _onFavoritePressed() {
    setState(() {
      isFavorite = !isFavorite;
      widget.product.isFavorite = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setSelectProductId(product.id);
        Navigator.pushNamed(context, AppRoutes.productDetail);
      },
      child: Container(
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
                    child:
                        product.imageUrl != null && product.imageUrl!.isNotEmpty
                        ? Image.network(
                            product.imageUrl!.first,
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
                        _onFavoritePressed();
                      },
                      behavior: HitTestBehavior.translucent,
                      child: SvgPicture.asset(
                        isFavorite
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        product.productName,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '${product.price}원',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
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

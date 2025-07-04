import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/app_router.dart';

import '../../../core/constants/app_routes.dart';
import '../data/product.dart';


class ProductItem extends StatefulWidget{
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItem();

}

class _ProductItem extends State<ProductItem>{

  bool isFavorite = false;

  void _setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        AppRouter.onGenerateRoute(RouteSettings(name: AppRoutes.productDetail));
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: (widget.product.imageUrl == null) ? null : DecorationImage(
                        image: NetworkImage(widget.product.imageUrl!.first),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  if (widget.product.imageUrl == null)
                    Center(
                      child: Text(
                        '상품 이미지가 없습니다',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  Positioned(
                    right: 12,
                    bottom: 14,

                    child: GestureDetector(
                      onTap: () {
                        _setFavorite();
                      },

                      child: SvgPicture.asset(
                        isFavorite ? 'images/icon/ic_heart_small_1.svg' : 'images/icon/ic_heart_small_0.svg',
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.product.productName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      widget.product.price,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
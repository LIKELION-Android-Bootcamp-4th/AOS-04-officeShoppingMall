import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/product.dart';


class ProductItem extends StatefulWidget{
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItem();

}

class _ProductItem extends State<ProductItem>{

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(// 눌렸을 때 라운드 효과
      onTap: () {
        Navigator.pushNamed(context, '/product_detail/${widget.product.id}');
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Positioned(
                    right: 11,
                    bottom: 13,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },

                      child: SvgPicture.asset(
                        isFavorite ? 'images/icon/ic_heart_small_1.svg' : 'images/icon/ic_heart_small_0.svg',
                        width: 20,
                        height: 20,
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
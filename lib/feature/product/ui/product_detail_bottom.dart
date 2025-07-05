import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';


class ProductDetailBottom extends StatefulWidget{
  const ProductDetailBottom({super.key});

  @override
  State<ProductDetailBottom> createState() => _ProductDetailBottom();

}

class _ProductDetailBottom extends State<ProductDetailBottom>{

  bool isFavorite = false;

  void _onFavoritePressed(){
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _onCartPressed(){

  }

  void _onBuyPressed(){

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),


        child: SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.zero,

              decoration: BoxDecoration(
                color: Colors.white,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: _onFavoritePressed,
                    child: SizedBox(
                      height: double.infinity,
                      child: SvgPicture.asset(
                        isFavorite
                            ? 'images/icon/ic_heart_large_1.svg'
                            : 'images/icon/ic_heart_large_0.svg',
                      )
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: _onCartPressed,
                      child: Container(
                        height: 48,
                        width: 128,

                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.gray100,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Text(
                          '장바구니',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: _onBuyPressed,
                      child: Container(
                        height: 48,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.onPrimaryColor,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Text(
                          '구매하기',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ]

              ),


            )
        )

    );


  }

}
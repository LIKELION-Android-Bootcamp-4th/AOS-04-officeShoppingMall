import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';


class ProductReviewContent extends StatelessWidget{


  Widget build(BuildContext context) {
    return Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          GestureDetector(

            onTap: () {

            },

            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  '상품 후기글 보러가기',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
            ),
          ),



        ]

    );

  }

}
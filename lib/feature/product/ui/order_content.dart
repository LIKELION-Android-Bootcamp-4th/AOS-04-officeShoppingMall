import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../data/product.dart';


class OrderContent extends StatelessWidget {
  const OrderContent({super.key});

  @override
  Widget build(BuildContext context) {
    final product = getSelectedProductData();

    if (product == null) {
      return Center(child: Text("상품 정보를 불러올 수 없습니다."));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: product.imageUrl != null && product.imageUrl!.isNotEmpty
                  ? Image.network(
                product.imageUrl!.first,
                fit: BoxFit.fill,
                width: 86,
                height: 86,
              )
                  : Container(
                color: AppColors.gray200,
                alignment: Alignment.center,
                width: 86,
                height: 86,
                child: Text(
                  '상품 이미지가 없습니다',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
              ),
            ),

            SizedBox(width: 16),

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    product.productName,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  ),

                  SizedBox(height: 4),

                  Text(
                    '${product.price}원',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,
                  ),

                ]

            ),
          ],
        ),

        SizedBox(height: 24),

        Container(
          width: double.infinity,
          height: 204,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '배송 정보',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(80, 40),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      backgroundColor: AppColors.gray200,
                      foregroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    onPressed: () {

                    },
                    child: Text('수정'),
                  )
                ],
              ),
              SizedBox(height: 12),
              Text('배송지 이름', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 4),
              Text('배송지 주소', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 4),
              Text('전화번호', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 4),
              Text('받는 사람', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),

        SizedBox(height: 16),

        Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '결제 수단',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.radio_button_checked, size: 18, color: AppColors.gray200),
                  SizedBox(width: 8),
                  Text('무통장 입금', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.radio_button_checked, size: 18, color: AppColors.gray200),
                  SizedBox(width: 8),
                  Text('실시간 계좌이체', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.radio_button_checked, size: 18, color: AppColors.gray200),
                  SizedBox(width: 8),
                  Text('카드 결제', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
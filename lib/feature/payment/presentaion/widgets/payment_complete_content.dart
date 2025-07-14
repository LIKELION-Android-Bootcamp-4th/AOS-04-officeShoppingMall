import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/payment/domain/order_info.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

class OrderCompleteContent extends StatelessWidget {
  final OrderInfo? info;
  const OrderCompleteContent({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final orderNum = '${now.year}${now.month}${now.day}${now.minute}${now.second}${now.millisecond}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text('주문 완료', style: Theme.of(context).textTheme.titleLarge)),

        SizedBox(height: 16),

        Center(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
            child: Center(
              child: SvgPicture.asset(
                'images/icon/ic_check.svg',
                colorFilter: ColorFilter.mode(AppColors.onPrimaryColor, BlendMode.srcIn),
              ),
            ),
          ),
        ),

        SizedBox(height: 32),

        Center(
          child: Text(
            '주문하신 상품을 곧 보내드리겠습니다.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(height: 32),

        Text('결제 정보', style: Theme.of(context).textTheme.titleMedium),

        SizedBox(height: 16),

        ProductContentContainer(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '결제 방식',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                  Text(
                    info!.paymentMethod,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '주문 번호',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                  Text(
                    orderNum,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '배송지',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                  Text(
                    info!.address,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 32),

        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('확인'),
          ),
        ),

        SizedBox(height: 16),
      ],
    );
  }
}

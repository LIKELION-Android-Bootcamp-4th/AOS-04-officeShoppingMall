import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

class OrderCompleteContent extends StatelessWidget {
  const OrderCompleteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text('주문 완료', style: Theme.of(context).textTheme.titleLarge)),

        SizedBox(height: 14),

        Center(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
            child: Center(
              child: SvgPicture.asset(
                'images/icon/ic_check.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ),

        SizedBox(height: 20),

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
                    '카드 결제',
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
                    '123456789',
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
                    '주소주소',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 32),

        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            ),
            child: Text('확인', style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}

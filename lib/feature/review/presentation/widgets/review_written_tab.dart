import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/data/models/dto/review_dto.dart';
import 'package:office_shopping_mall/feature/review/presentation/widgets/review_written_item.dart';

import '../../../../core/constants/app_routes.dart';
import '../viewmodel/review_model.dart';

class ReviewWrittenTab extends StatefulWidget{
  const ReviewWrittenTab({super.key});

  @override
  State<StatefulWidget> createState() => _ReviewWrittenTab();
}

class _ReviewWrittenTab extends State<ReviewWrittenTab> {

  late ReviewModel vm;
  late List<ReviewDTO> review;

  @override
  void initState() {
    super.initState();
    vm = context.read<ReviewModel>();
    vm.getMyReview();
  }

  @override
  Widget build(BuildContext context) {
    // 예시 데이터 리스트
    final items = [
      {'title': '리뷰 작성 완료 상품 A', 'count': 2, 'price': 100000},
      {'title': '리뷰 작성 완료 상품 B', 'count': 1, 'price': 50000},
      {'title': '리뷰 작성 완료 상품 C', 'count': 3, 'price': 150000},
      // 계속 추가 가능
    ];

    return Align(
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true, // Column 안에 있을 때 필요
        physics: NeverScrollableScrollPhysics(), // 상위 스크롤에 영향 안 주도록
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ReviewWrittenItem(
              title: item['title'] as String,
              count: item['count'] as int,
              price: item['price'] as int,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.reviewDetail);
              },
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/review/presentation/viewmodel/review_model.dart';

import '../../../core/data/models/dto/review_dto.dart';

class ReviewDetailScreen extends StatefulWidget {

  const ReviewDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => ReviewDetailScreenState();
}

class ReviewDetailScreenState extends State<ReviewDetailScreen> {
  late ReviewDTO review;

  @override
  void initState() {
    super.initState();
    var vm = context.read<ReviewModel>();
    review = vm.selectedReview!;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: '리뷰'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("별점: ${review.rating}점"),
            SizedBox(height: 20),
            Text("작성자 ID: ${review.userId}"),
            SizedBox(height: 10),
            Text("작성 후기"),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.gray100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  review.comment.isEmpty ? "내용이 없습니다." : review.comment,
                ),
              ),
            ),
            SizedBox(height: 30),

            Row(
              children: review.images != null && review.images!.isNotEmpty
                  ? review.images!
                  .map((image) => Padding(
                padding: EdgeInsets.only(right: 8),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey,
                  child: Center(child: Text("Image")),
                ),
              ))
                  .toList()
                  : [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey,
                  child: Center(child: Text("No Image")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
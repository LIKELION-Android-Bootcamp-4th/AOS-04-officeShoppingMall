import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';

class ReviewDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReviewDetailScreenState();
  }
}

class ReviewDetailScreenState extends State<ReviewDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '리뷰'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("별점"),
            SizedBox(height: 50),
            Text("작성 후기"),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.gray100,
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text("최대 50자 제한. 일이삼사오육칠팔구십."),
              )
            ),
            SizedBox(height: 30),
            
            //첨부 사진
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Container(width: 80, height: 80, color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Container(width: 80, height: 80, color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Container(width: 80, height: 80, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      appBar: CustomAppBar(title: '리뷰',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("별점"),
          SizedBox(height: 20,),
          Text("작성 후기"),
          Container(
            decoration: BoxDecoration(
              color: appColorScheme().surfaceContainer,
              borderRadius: BorderRadiusGeometry.circular(10),
              border: Border.all(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
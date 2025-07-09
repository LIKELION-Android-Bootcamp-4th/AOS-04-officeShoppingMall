import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/review/presentation/review_detail_screen.dart';

class ReviewWrittenTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 190,
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ReviewDetailScreen()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      width: 86,
                      height: 86,
                      margin: EdgeInsets.only(top: 6, left: 5),
                      decoration: BoxDecoration(
                        color: appColorScheme().surfaceContainer,
                        borderRadius: BorderRadiusGeometry.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "리뷰 작성 완료 상품",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text("2개", style: TextStyle(fontSize: 15)),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 3),
                              child: Text(
                                "100,000",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text("원", style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
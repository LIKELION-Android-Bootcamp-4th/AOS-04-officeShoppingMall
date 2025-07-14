import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme.dart';

class ReviewWrittenItem extends StatelessWidget {
  final String title;
  final int count;
  final int price;
  final VoidCallback? onTap;

  const ReviewWrittenItem({
    super.key,
    required this.title,
    required this.count,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 190,
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
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
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3),
                  Text("$count개", style: Theme.of(context).textTheme.bodyMedium),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 3),
                        child: Text(
                          price.toString(),
                          style: Theme.of(context).textTheme.titleSmall
                        ),
                      ),
                      Text("원", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
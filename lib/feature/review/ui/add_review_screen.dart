import 'package:flutter/material.dart';

import '../../../core/widgets/app_bar/custom_app_bar.dart';
import 'add_review_content.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "리뷰 작성"),

      body: Container(padding: EdgeInsets.all(16), child: AddReviewContent()),
    );
  }
}

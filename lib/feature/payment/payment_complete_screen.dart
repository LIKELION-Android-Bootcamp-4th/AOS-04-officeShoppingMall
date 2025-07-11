import 'package:flutter/material.dart';

import 'presentaion/widgets/payment_complete_content.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: 64),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 20), OrderCompleteContent()],
            ),
          ],
        ),
      ),
    );
  }
}

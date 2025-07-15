import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/payment/domain/order_info.dart';

import 'presentaion/widgets/payment_complete_content.dart';

class PaymentCompleteScreen extends StatelessWidget {
  const PaymentCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)!.settings.arguments as OrderInfo?;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: 64),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 20), PaymentCompleteContent(info: info)],
            ),
          ],
        ),
      ),
    );
  }
}

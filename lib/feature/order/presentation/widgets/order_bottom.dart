import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../product/presentation/widgets/product_button.dart';

class OrderBottom extends StatefulWidget {
  const OrderBottom({super.key, required this.onSelected});

  final Function onSelected;

  @override
  State<OrderBottom> createState() => _OrderBottom();
}

class _OrderBottom extends State<OrderBottom> {
  onSelected() {
    widget.onSelected();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      child: SizedBox(
        width: double.infinity,
        child: Container(
            margin: EdgeInsets.zero,
            child: ProductButton(
              text: '결제',
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              onPressed: () {
                onSelected();
              },
            )
        ),
      ),
    );
  }
}

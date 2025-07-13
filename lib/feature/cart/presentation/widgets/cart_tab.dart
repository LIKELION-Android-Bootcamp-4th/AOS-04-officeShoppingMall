import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_list_item.dart';
import 'package:office_shopping_mall/feature/cart/presentation/viewmodel/cart_viewmodel.dart';
import 'package:office_shopping_mall/feature/payment/payment_screen.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_button.dart';
import 'package:provider/provider.dart';

class CartTab extends StatefulWidget {
  @override
  State<CartTab> createState() => CartTabState();
}

class CartTabState extends State<CartTab> {
  @override
  void initState() {
    super.initState();
    context.read<CartViewModel>().loadCarts();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CartViewModel>();

    return Scaffold(
      body: ListView.builder(
        itemCount: viewModel.carts.length,
        itemBuilder: (context, index) {
          return CartListItem(cart: viewModel.carts[index], index: index);
        },
      ),

      //금액~결제 버튼
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: appColorScheme().surfaceContainer,
                width: 1,
              ),
            ),
          ),
          child: Container(
            color: Colors.white,
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        "결제 금액",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 16, right: 16),
                      child: Text(
                        '${NumberFormat('#,###').format(viewModel.selectedTotalPrice)}원',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: ProductButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderScreen()),
                      );
                    },
                    text: '결제',
                    backgroundColor: AppColors.primaryColor,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

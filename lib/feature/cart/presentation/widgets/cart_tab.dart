import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/cart/presentation/widgets/cart_list_item.dart';
import 'package:office_shopping_mall/feature/cart/presentation/viewmodel/cart_viewmodel.dart';
import 'package:office_shopping_mall/feature/payment/payment_screen.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_button.dart';
import 'package:office_shopping_mall/feature/setting/data/setting_address.dart';
import 'package:office_shopping_mall/feature/setting/presentation/viewmodel/setting_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/loading_indicator.dart';

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
      body: _buildBody(viewModel),
      bottomNavigationBar: _buildBottomBar(context, viewModel),
    );
  }


  Widget _buildBody(CartViewModel viewModel) {
    if (viewModel.isLoading) {
      return Center(child: CustomCircleIndicator());
    }

    if (viewModel.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('에러가 발생했습니다: ${viewModel.error}'),
          ],
        ),
      );
    }

    if (viewModel.carts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('장바구니가 비어있습니다'),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: viewModel.carts.length,
      itemBuilder: (context, index) {
        return CartListItem(cart: viewModel.carts[index], index: index);
      },
    );
  }


  Widget _buildBottomBar(BuildContext context, CartViewModel viewModel) {
    return Padding(
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
          color: AppColors.backgroundColor,
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 16, right: 16),
                    child: Text(
                      viewModel.getSelectedTotalPrice.toWon,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: ProductButton(
                  onPressed: () async {
                    if (viewModel.selectedCarts.isEmpty) return;

                    final cartIds = viewModel.selectedCarts.map((e) => e.id).toList();
                    final settingAddr = context.read<SettingViewModel>().getDefaultAddress();

                    final orderResponse = await viewModel.orderFromCart(
                      cartIds: cartIds,
                      recipient: settingAddr.recipient,
                      address: settingAddr.addr,
                      phone: settingAddr.phone,
                    );

                    if (orderResponse != null) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.order,
                        arguments: orderResponse.data,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('주문에 실패했습니다. 다시 시도해주세요.')),
                      );
                    }
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
    );
  }
}
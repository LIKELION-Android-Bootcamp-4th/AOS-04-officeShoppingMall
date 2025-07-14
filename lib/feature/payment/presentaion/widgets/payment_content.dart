import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/payment/domain/order_info.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';
import 'package:office_shopping_mall/feature/setting/data/setting_address.dart';
import 'package:office_shopping_mall/feature/setting/presentation/viewmodel/setting_viewmodel.dart';

import '../../../product/presentation/viewmodel/product_viewmodel.dart';

class OrderContent extends StatefulWidget {
  final Product product;
  final ValueChanged<OrderInfo> onChanged;

  const OrderContent({super.key, required this.product, required this.onChanged});

  @override
  State<OrderContent> createState() => _OrderContentState();
}

class _OrderContentState extends State<OrderContent> {
  String _payment = '';
  String _address = '';
  int _quantity = 1;

  void _onChanged(String value) {
    setState(() {
      _payment = value;
      _notify();
    });
  }

  void _notify() {
    widget.onChanged(
      OrderInfo(
        paymentMethod: _payment,
        address: _address,
        quantity: _quantity,
        unitPrice: widget.product.price,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Product product = context.select((ProductViewModel vm) => vm.selectedProduct!);
    final settingVm = context.watch<SettingViewModel>();

    SettingAddress? settingAddr;
    try {
      settingAddr = settingVm.getDefaultAddress();
      _address = settingAddr.addr;
    } catch (e) {
      settingAddr = null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: product.thumbnailImage != null
                  ? Image.network(
                      product.thumbnailImage!.url,
                      fit: BoxFit.fill,
                      width: 86,
                      height: 86,
                    )
                  : Container(
                      color: AppColors.gray200,
                      alignment: Alignment.center,
                      width: 86,
                      height: 86,
                      child: Text('상품 이미지가 없습니다', style: Theme.of(context).textTheme.bodySmall),
                    ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 4),
                Text(product.price.toWon, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ],
        ),
        SizedBox(height: 24),

        ProductContentContainer(
          width: double.infinity,
          height: 204,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('배송 정보', style: Theme.of(context).textTheme.titleMedium),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(60, 30),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      backgroundColor: AppColors.gray200,
                      foregroundColor: AppColors.onBackgroundColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                    ),
                    onPressed: () {},
                    child: Text('수정'),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text('배송지 이름', style: Theme.of(context).textTheme.bodyMedium),
                  Spacer(),
                  Text(settingAddr?.name ?? ''),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('배송지 주소', style: Theme.of(context).textTheme.bodyMedium),
                  Spacer(),
                  Text(settingAddr?.addr ?? ''),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('전화번호', style: Theme.of(context).textTheme.bodyMedium),
                  Spacer(),
                  Text(settingAddr?.phone ?? ''),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('받는 사람', style: Theme.of(context).textTheme.bodyMedium),
                  Spacer(),
                  Text(settingAddr?.recipient ?? ''),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16),

        ProductContentContainer(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('결제 수단', style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 12),
              RadioListTile(
                value: '무통장 입금',
                groupValue: _payment,
                onChanged: (value) => _onChanged(value!),
                title: Text('무통장 입금', style: Theme.of(context).textTheme.bodyMedium),
                contentPadding: EdgeInsets.all(0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              ),

              RadioListTile(
                value: '실시간 계좌이체',
                groupValue: _payment,
                onChanged: (value) => _onChanged(value!),
                title: Text('실시간 계좌이체', style: Theme.of(context).textTheme.bodyMedium),
                contentPadding: EdgeInsets.all(0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              ),

              RadioListTile(
                value: '카드 결제',
                groupValue: _payment,
                onChanged: (value) => _onChanged(value!),
                title: Text('카드 결제', style: Theme.of(context).textTheme.bodyMedium),
                contentPadding: EdgeInsets.all(0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/feature/payment/domain/order_info.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';
import 'package:office_shopping_mall/feature/setting/data/setting_address.dart';
import 'package:office_shopping_mall/feature/setting/presentation/viewmodel/setting_viewmodel.dart';
import '../../../cart/data/cart_order_response.dart';
import '../../../product/presentation/viewmodel/product_viewmodel.dart';

class CartPaymentContent extends StatefulWidget {
  final List<OrderData> orders;
  final ValueChanged<OrderInfo> onChanged;

  const CartPaymentContent({
    super.key,
    required this.orders,
    required this.onChanged,
  });

  @override
  State<CartPaymentContent> createState() => _CartPaymentContentState();
}

class _CartPaymentContentState extends State<CartPaymentContent> {
  String _payment = '';
  String _address = '';
  final Map<String, String?> _productImages = {};

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
        quantity: 1,
        unitPrice: widget.orders.fold(
          0,
          (sum, order) => sum + order.totalAmount,
        ),
        recipient: '',
        phone: '',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadMissingImages();
  }

  Future<void> _loadMissingImages() async {
    final productVm = context.read<ProductViewModel>();

    for (var order in widget.orders) {
      for (var item in order.items) {
        if (item.productImage == null &&
            !_productImages.containsKey(item.productId)) {
          try {
            await productVm.getProductById(item.productId);
            final imageUrl = productVm.selectedProduct?.thumbnailImage?.url;

            setState(() {
              _productImages[item.productId] = imageUrl;
            });
          } catch (e) {
            print('상품 정보 불러오기 실패: $e');
            _productImages[item.productId] = null;
          }
        } else {
          _productImages[item.productId] = item.productImage;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
        Container(
          constraints: BoxConstraints(maxHeight: 88),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.orders.length,
            itemBuilder: (context, orderIndex) {
              final order = widget.orders[orderIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...order.items
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:
                                    (item.productImage != null ||
                                        _productImages[item.productId] != null)
                                    ? Image.network(
                                        item.productImage ??
                                            _productImages[item.productId]!,
                                        fit: BoxFit.fill,
                                        width: 80,
                                        height: 80,
                                      )
                                    : Container(
                                        color: AppColors.gray200,
                                        alignment: Alignment.center,
                                        width: 80,
                                        height: 80,
                                        child: Text(
                                          '상품 이미지가 없습니다',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall,
                                        ),
                                      ),
                              ),
                              SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.productName,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${item.quantity}개 × ${item.unitPrice.toWon}',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                    Text(
                                      '${item.totalPrice.toWon}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  if (orderIndex < widget.orders.length - 1) Divider(),
                ],
              );
            },
          ),
        ),

        SizedBox(height: 16),

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
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      backgroundColor: AppColors.gray200,
                      foregroundColor: AppColors.onBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.setting);
                    },
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
                title: Text(
                  '무통장 입금',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                contentPadding: EdgeInsets.all(0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              ),
              RadioListTile(
                value: '실시간 계좌이체',
                groupValue: _payment,
                onChanged: (value) => _onChanged(value!),
                title: Text(
                  '실시간 계좌이체',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                contentPadding: EdgeInsets.all(0),
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              ),
              RadioListTile(
                value: '카드 결제',
                groupValue: _payment,
                onChanged: (value) => _onChanged(value!),
                title: Text(
                  '카드 결제',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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

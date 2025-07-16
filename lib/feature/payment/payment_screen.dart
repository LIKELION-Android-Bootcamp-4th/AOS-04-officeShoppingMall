import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/data/models/dto/shipping_info_dto.dart';
import 'package:office_shopping_mall/core/data/models/entity/product.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/utils/extension.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/loading_indicator.dart';
import 'package:office_shopping_mall/feature/order/data/order_add_requset.dart';
import 'package:office_shopping_mall/feature/order/data/order_product_dto.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_list_viewmodel.dart';
import 'package:office_shopping_mall/feature/payment/domain/order_info.dart';
import 'package:office_shopping_mall/feature/payment/presentaion/widgets/cart_payment_content.dart';
import 'package:office_shopping_mall/feature/payment/presentaion/widgets/payment_content.dart';
import 'package:office_shopping_mall/feature/product/presentation/viewmodel/product_viewmodel.dart';
import 'package:office_shopping_mall/feature/payment/presentaion/widgets/payment_bottom.dart';

import '../cart/data/cart_order_response.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  OrderInfo? _orderInfo;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final Product product = context.select((ProductViewModel vm) => vm.selectedProduct!);

    final bool isCartOrder = args is List<OrderData>;
    final List<OrderData>? cartOrders = isCartOrder ? args as List<OrderData> : null;
    final Product? singleProduct = !isCartOrder
        ? context.select((ProductViewModel vm) => vm.selectedProduct)
        : null;

    return Scaffold(
      extendBody: true,

      appBar: CustomAppBar(title: "결제", titleTextStyle: Theme.of(context).textTheme.titleLarge),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: isCartOrder
            ? CartPaymentContent(
                orders: cartOrders!,
                onChanged: (info) => setState(() => _orderInfo = info),
              )
            : PaymentContent(
                product: singleProduct!,
                onChanged: (info) => setState(() => _orderInfo = info),
              ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.gray200,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, -1),
            ),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 16),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('결제 금액', style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    isCartOrder
                        ? cartOrders!.fold(0, (sum, order) => sum + order.totalAmount).toWon
                        : (singleProduct!.price * (_orderInfo?.quantity ?? 1)).toWon,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),

            PaymentBottom(
              onSelected: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    if (_orderInfo?.paymentMethod == null) {
                      return AlertDialog(
                        content: Text("결제 방식을 선택해 주세요."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text("확인"),
                          ),
                        ],
                      );
                    }

                    if (cartOrders == null) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: AlertDialog(
                          content: Text("배송 정보를 입력해 주세요."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text("확인"),
                            ),
                          ],
                        ),
                      );
                    }

                    return AlertDialog(
                      title: Text("결제"),
                      content: Text("결제 하시겠습니까?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text("취소"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text("확인"),
                        ),
                      ],
                    );
                  },
                );

                if (confirm == true) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(child: CustomCircleIndicator()),
                  );

                  final items = isCartOrder
                      ? cartOrders!.expand((order) => order.items.map(
                        (item) => OrderProductDTO(
                      productName: item.productName,
                      quantity: item.quantity,
                      unitPrice: item.unitPrice,
                      totalPrice: item.totalPrice,
                      thumbnailImageUrl: item.productImage ?? '',
                      productId: item.productId,
                    ),
                  )).toList()
                      : [
                    OrderProductDTO(
                      productName: product.name,
                      quantity: _orderInfo!.quantity,
                      unitPrice: product.price,
                      totalPrice: _orderInfo!.quantity * product.price,
                      thumbnailImageUrl: product.thumbnailImage!.url,
                      productId: product.id,
                    )
                  ];

                  OrderAddRequest request = OrderAddRequest(
                    items: [
                      OrderProductDTO(
                        productName: product.name,
                        quantity: _orderInfo!.quantity,
                        unitPrice: product.price,
                        totalPrice: _orderInfo!.quantity * product.price,
                        thumbnailImageUrl: product.thumbnailImage!.url,
                        productId: product.id,
                      ),
                    ],
                    shippingInfo: ShippingInfoDTO(
                      recipient: _orderInfo!.recipient,
                      address: _orderInfo!.address,
                      phone: _orderInfo!.phone,
                    ),
                    payment: _orderInfo!.paymentMethod,
                    memo: '',
                  );
                  await context.read<OrderListViewModel>().addOrder(request);
                  await Future.delayed(Duration(seconds: 2));

                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRoutes.orderComplete, arguments: _orderInfo);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_viewmodel.dart';

class OrderDetailScreen extends StatefulWidget {
  final int index;

  OrderDetailScreen({super.key, required this.index});

  @override
  State<OrderDetailScreen> createState() => OrderDetailScreenState();
}

class OrderDetailScreenState extends State<OrderDetailScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OrderViewModel>();
    final orders = context.watch<OrderViewModel>().orders;
    final order = orders[widget.index];

    return Scaffold(
      appBar: CustomAppBar(title: '주문 정보'),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 130,
                  child: order.product.thumbnailImage == null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.gray200,
                          ),
                          child: Center(
                            child: Text(
                              '상품 이미지가 없습니다',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        )
                      : PageView.builder(
                          itemCount: order.product.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    order.product.images[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            order.product.name,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Spacer(),

                          Text(
                            (() {
                              switch (order.orderIndex) {
                                case 1:
                                  return '결제 완료';
                                case 2:
                                  return '배송 중';
                                case 3:
                                  return '배송 완료';
                                case 4:
                                  return '배송 완료';
                                default:
                                  return '오류';
                              }
                            })(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${NumberFormat('#,###').format(order.product.price)}원',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            //결제 정보
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10, left: 24),
                child: Text(
                  "결제 정보",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.86,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: appColorScheme().surfaceContainer,
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, top: 30),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.height * 0.4,
                            child: Row(
                              children: [
                                Text(
                                  "결제 방식",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Text(
                                    "카드 결제",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: MediaQuery.of(context).size.height * 0.4,
                            child: Row(
                              children: [
                                Text(
                                  "주문 번호",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Text(
                                    order.orderId,
                                    style: Theme.of(context,).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "주소",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Spacer(),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text(
                                      "주소입니다아아아아 길어지면 줄바꿈 됩니다아아아아",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                      textAlign: TextAlign.end,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      maxLines: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            //주문 취소버튼. 결제 완료 상태에서만 보여야 됨
            order.orderIndex == 1
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.86,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Color(0x80D9D9D9),
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        //주문 취소 확인 팝업
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        "주문을 취소 하시겠습니까?",
                                        style: Theme.of(context,).textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text("아니요"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    viewModel.cancelOrder(order.orderId);
                                    Navigator.pop(context);
                                  },
                                  child: Text("네"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "주문 취소",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  )
                : SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
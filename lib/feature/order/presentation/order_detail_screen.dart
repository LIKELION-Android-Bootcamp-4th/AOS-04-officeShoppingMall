import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_viewmodel.dart';

class OrderDetailScreen extends StatefulWidget {
  final int index;
  OrderDetailScreen({super.key, required this.index});

  @override
  State<OrderDetailScreen> createState() => OrderDetailScreenState();
}

class OrderDetailScreenState extends State<OrderDetailScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OrderViewModel>();
    final orders = context.watch<OrderViewModel>().orders;
    final order = orders[widget.index];

    return Scaffold(
      appBar: CustomAppBar(title: '주문 정보',),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 86,
                  height: 86,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: appColorScheme().surfaceContainer,
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.64,
                      child: Row(
                        children: [
                          Text(
                            order.product.name,
                            style: Theme.of(context).textTheme.titleSmall
                          ),
                          Spacer(),
                          Text(
                            '${order.orderIndex}',
                            style: Theme.of(context).textTheme.titleSmall
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('${order.product.price}', style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            //결제 정보
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10, left: 24),
                child: Text("결제 정보", style: Theme.of(context).textTheme.titleLarge),
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
                                Text("결제 방식", style: Theme.of(context).textTheme.titleMedium),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Text("카드 결제", style: Theme.of(context).textTheme.titleMedium,),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: MediaQuery.of(context).size.height * 0.4,
                            child: Row(
                              children: [
                                Text("주문 번호", style: Theme.of(context).textTheme.titleLarge),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Text('${order.orderId}', style: Theme.of(context).textTheme.titleLarge,),
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
                                Text("주소", style: Theme.of(context).textTheme.titleLarge),
                                Spacer(),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text(
                                      "주소입니다아아아아 길어지면 줄바꿈 됩니다아아아아",
                                      style: Theme.of(context).textTheme.titleLarge,
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
            order.orderIndex == 1 ?
            Container(
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
                                  style: Theme.of(context).textTheme.titleLarge,
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
                            onPressed: (){viewModel.cancelOrder(order.orderId);},
                            child: Text("네"),),
                        ],
                      );
                    },
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text("주문 취소", style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            )
            : SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
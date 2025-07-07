import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderDetailScreenState();
  }
}

class OrderDetailScreenState extends State<OrderDetailScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('images/icon/ic_back.svg'),
        ),
        title: Text("주문 정보", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
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
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadiusGeometry.circular(10),
                    border: Border.all(color: Colors.black),
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
                            "상품명",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "결제 완료",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("800원", style: TextStyle(fontSize: 18)),
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
                child: Text("결제 정보", style: TextStyle(fontSize: 18)),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.86,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Color(0x4DD9D9D9),
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
                                Text("결제 방식", style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Text("카드 결제", style: TextStyle(fontSize: 15)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: MediaQuery.of(context).size.height * 0.4,
                            child: Row(
                              children: [
                                Text("주문 번호", style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Text("123456789", style: TextStyle(fontSize: 15)),
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
                                Text("주소", style: TextStyle(fontSize: 15)),
                                Spacer(),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text(
                                      "주소입니다아아아아 길어지면 줄바꿈 됩니다아아아아",
                                      style: TextStyle(fontSize: 15),
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

            //주문 취소버튼. 결제 완료 상태에서만 보여야 됨(예정)
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
                                child: Text("주문을 취소 하시겠습니까?", style: TextStyle(fontSize: 20)),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(onPressed: () {}, child: Text("네")),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("아니요"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text("주문 취소", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/feature/notification/data/app_notification_list.dart';
import 'package:office_shopping_mall/feature/notification/ui/notification_navigation.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationScreenState();
  }
}

class NotificationScreenState extends State<NotificationScreen> {
  int _selectNotiIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '알림',
        actions: AppBarActionsNoBell(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NotificationNavigation(
            selectNotiIndex: _selectNotiIndex,
            onTap: (index){
              setState(() {
                _selectNotiIndex = index;
              });
            },
          ),
          Expanded(
            child: IndexedStack(
              index: _selectNotiIndex,
              children: [
                Column(
                  children: [
                    Text("전체 알림 탭 입니다"),
                    AppNotificationList(),
                  ],
                ),
                Text("공지사항 알림 탭입니다"),
                Text("배송 상황 알림 탭입니다"),
                Text("광고 알림 탭입니다"),
              ],
            ),
          ),
        ],
      )
    );
  }
}
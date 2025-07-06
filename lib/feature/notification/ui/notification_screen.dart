import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/app_bar_actions.dart';
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
      appBar: CustomAppBar(title: '알림', actions: AppBarActionsNoBell()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NotificationNavigation(
            selectNotiIndex: _selectNotiIndex,
            onTap: (index) {
              setState(() {
                _selectNotiIndex = index;
              });
            },
          ),
          Expanded(
            child: IndexedStack(
              index: _selectNotiIndex,
              children: [
                //전체 알림
                ListView.builder(
                  itemCount: notiList.length,
                  itemBuilder: (context, index) {
                    return AppNotificationList(notification: notiList[index]);
                  },
                ),
                //공지사항 알림
                ListView(
                  children: notiList
                      .where((e) => e.notiIndex == 1)
                      .map((e) => AppNotificationList(notification: e))
                      .toList(),
                ),
                //배송 알림
                ListView(
                  children: notiList
                      .where((e) => e.notiIndex == 2)
                      .map((e) => AppNotificationList(notification: e))
                      .toList(),
                ),
                //광고 알림
                ListView(
                  children: notiList
                      .where((e) => e.notiIndex == 3)
                      .map((e) => AppNotificationList(notification: e))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

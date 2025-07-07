import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/widgets/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/custom_tab_bar.dart';
import 'package:office_shopping_mall/feature/notification/data/app_notification_list.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationScreenState();
  }
}

class NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '알림', actions: appBarActionsNoBell()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customTabBar(
            controller: _controller,
            tabs: [
              Tab(text: '전체 알림'),
              Tab(text: '공지사항'),
              Tab(text: '배송 알림'),
              Tab(text: '광고'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
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

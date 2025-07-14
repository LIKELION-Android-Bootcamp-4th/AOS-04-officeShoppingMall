import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/app_bar_actions.dart';
import 'package:office_shopping_mall/core/widgets/app_bar/custom_app_bar.dart';
import 'package:office_shopping_mall/core/widgets/custom_tab_bar.dart';
import 'package:office_shopping_mall/feature/notification/data/notification_item.dart';
import 'package:office_shopping_mall/feature/notification/presentation/viewmodel/notification_viewmodel.dart';

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
    Future.microtask(() {
      context.read<NotificationViewModel>().loadNoti();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notice = context.watch<NotificationViewModel>();
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
                  itemCount: notice.noti.length,
                  itemBuilder: (context, index) {
                    return NotificationItem(noti: notice.noti[index]);
                  },
                ),
                //공지사항 알림
                ListView.builder(
                  itemCount: notice.noti.where((e) => e.category == 'system').length,
                  itemBuilder: (context, index){
                    final list = notice.noti.where((e) => e.category == 'system').toList();
                    return NotificationItem(noti: list[index]);
                  }
                ),
                //배송 알림
                ListView.builder(
                    itemCount: notice.noti.where((e) => e.category == 'general').length,
                    itemBuilder: (context, index){
                      final list = notice.noti.where((e) => e.category == 'general').toList();
                      return NotificationItem(noti: list[index]);
                    }
                ),
                //광고 알림
                ListView.builder(
                    itemCount: notice.noti.where((e) => e.category == 'event').length,
                    itemBuilder: (context, index){
                      final list = notice.noti.where((e) => e.category == 'event').toList();
                      return NotificationItem(noti: list[index]);
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

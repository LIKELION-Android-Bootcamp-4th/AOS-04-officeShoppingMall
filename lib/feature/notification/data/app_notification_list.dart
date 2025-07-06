import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/notification/data/app_notification.dart';

final List<AppNotification> notiList = [
  AppNotification("공지 알림입니다", 1),
  AppNotification("배송 알림입니다", 2),
  AppNotification("광고 알림입니다", 3),
];

class AppNotificationList extends StatelessWidget {
  final AppNotification notification;
  const AppNotificationList({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: 360,
      height: 100,
      decoration: BoxDecoration(
        color: appColorScheme().surfaceContainerLow,
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(notification.notiString),
        )
      )
    );
  }
}
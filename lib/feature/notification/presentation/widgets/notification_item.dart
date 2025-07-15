import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/notification/data/notificationDTO.dart';

class NotificationItem extends StatelessWidget {
  final NotificationDTO notice;
  const NotificationItem({super.key, required this.notice});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        width: 360,
        constraints: BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color: appColorScheme().surfaceContainerLow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(notice.content, style: Theme.of(context).textTheme.bodyMedium),
            )
        )
    );
  }
}
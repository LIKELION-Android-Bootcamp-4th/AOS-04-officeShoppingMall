import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/notification_dto.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

class NotificationItem extends StatelessWidget {
  final NotificationDTO noti;
  const NotificationItem({required this.noti});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        width: 360,
        constraints: BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color: appColorScheme().surfaceContainerLow,
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(noti.content, style: Theme.of(context).textTheme.bodyMedium),
            )
        )
    );
  }
}
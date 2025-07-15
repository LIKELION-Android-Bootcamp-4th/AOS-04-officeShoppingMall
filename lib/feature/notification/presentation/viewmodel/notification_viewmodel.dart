import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/notification/data/notificationDTO.dart';
import 'package:office_shopping_mall/feature/notification/domain/notification_repository.dart';

class NotificationViewModel extends ChangeNotifier {
  final NotificationRepository _repository;
  NotificationViewModel(this._repository);

  List<NotificationDTO> noti = [];

  Future<void> loadNotices() async {
    noti.clear();
    notifyListeners();
    try {
      final notiList = await _repository.getNotices();
      noti.addAll(notiList);
      notifyListeners();
    } catch(e) {
      print("불러오기 실패: $e");
    }
  }
}
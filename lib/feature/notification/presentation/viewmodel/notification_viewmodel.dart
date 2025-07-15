import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/notification/data/notificationDTO.dart';
import 'package:office_shopping_mall/feature/notification/domain/notification_repository.dart';

class NotificationViewModel extends ChangeNotifier {
  final NotificationRepository _repository;
  NotificationViewModel(this._repository);

  List<NotificationDTO> notices = [];

  Future<void> loadNotices() async {
    notices.clear();
    notifyListeners();
    try {
      final noticeList = await _repository.getNotices();
      notices.addAll(noticeList);
      notifyListeners();
    } catch(e) {
      print("불러오기 실패: $e");
    }
  }
}
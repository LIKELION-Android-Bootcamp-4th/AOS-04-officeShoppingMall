import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/notification_dto.dart';
import 'package:office_shopping_mall/feature/notification/data/notification_repository.dart';

class NotificationViewModel extends ChangeNotifier {
  final NotificationRepository _repository;
  NotificationViewModel(this._repository);

  List<NotificationDTO> noti = [];

  Future<void> loadNoti() async {
    noti.clear();
    notifyListeners();
    try {
      final notiList = await _repository.getNoti();
      noti.addAll(notiList);
      notifyListeners();
    } catch(e) {
      print("불러오기 실패: $e");
    }
  }
}
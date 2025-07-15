import 'package:office_shopping_mall/feature/notification/data/notificationDTO.dart';
import 'package:office_shopping_mall/feature/notification/data/notification_service.dart';

class NotificationRepository {
  final NotificationService _service;
  NotificationRepository(this._service);

  Future<List<NotificationDTO>> getNotices() {
    return _service.getNotices();
  }
}
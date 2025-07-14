import 'package:office_shopping_mall/core/data/models/dto/notification_dto.dart';
import 'package:office_shopping_mall/feature/notification/data/notification_service.dart';

class NotificationRepository {
  final NotificationService _service;
  NotificationRepository(this._service);

  Future<List<NotificationDTO>> getNoti() {
    return _service.getNoti();
  }
}
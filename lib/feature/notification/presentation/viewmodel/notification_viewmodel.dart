import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/notification_dto.dart';
import 'package:office_shopping_mall/feature/notification/data/notification_repository.dart';
import 'package:office_shopping_mall/feature/notification/data/notification_service.dart';

class NotificationViewModel extends ChangeNotifier {
  final NotificationRepository _repository;
  final NotificationService _service;
  NotificationViewModel(this._repository, this._service);

  List<NotificationDTO> noti = [];


}
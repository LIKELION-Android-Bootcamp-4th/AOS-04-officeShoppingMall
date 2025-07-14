import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/notification_dto.dart';

class NotificationService {
  final Dio _dio;
  NotificationService(this._dio);

  Future<List<NotificationDTO>> getNoti() async {
    final response = await _dio.get(Api.notice.getNotices());
    final data = response.data as List;
    return data.map((e) => NotificationDTO.fromJson(e)).toList();
  }
}
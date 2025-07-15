import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/feature/notification/data/notificationDTO.dart';

class NotificationService {
  final Dio _dio;
  NotificationService(this._dio);

  Future<List<NotificationDTO>> getNotices() async {
    final response = await _dio.get(Api.notice.getNotices());
    if (response.statusCode == 200) {
      final items = response.data['data']['items'] as List;

      return items.map((item) => NotificationDTO.fromJson(item)).toList();
    } else {
      throw Exception(
        '공지 목록 조회 실패: ${response.statusCode}, message: ${response.data}',
      );
    }
  }
}

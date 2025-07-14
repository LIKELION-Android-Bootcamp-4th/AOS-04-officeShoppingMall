import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/notification_dto.dart';

class NotificationService {
  final Dio _dio;
  NotificationService(this._dio);

  Future<List<NotificationDTO>> getNoti() async {
    final response = await _dio.get(
      Api.notice.getNotices(),
      options: Options(headers: {'X-Company-Code': '6866fd325b230f5dc709bdf7'}),
    );

    print('[API 요청] ${response.requestOptions.uri}');
    print('[요청 헤더] ${response.requestOptions.headers}');

    final items = response.data['data']['items'] as List;

    return items.map((e) => NotificationDTO.fromJson(e)).toList();
  }
}

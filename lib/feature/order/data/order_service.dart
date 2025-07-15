import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/feature/order/data/order_cancel_request.dart';

class OrderService {
  final Dio _dio;
  OrderService(this._dio);
  
  Future<List<OrderDTO>> getOrders() async {
    final response = await _dio.get(Api.mypage.getOrders());
    if (response.statusCode == 200) {
      final items = response.data['data']['items'] as List;

      return items.map((item) => OrderDTO.fromJson(item)).toList();
    } else {
      throw Exception(
        '상품 목록 조회 실패: ${response.statusCode}, message: ${response.data}',
      );
    }
  }
  
  Future<OrderDTO> getOrderDetail(String id) async {
    final response = await _dio.get(Api.order.getOrderDetail(id));
    final data = response.data['data'];
    return OrderDTO.fromJson(data);
  }
  
  // Future<void> addOrder(OrderDTO order) async {
  //   final response = await _dio.post(Api.mypage.addOrder());
  //   if (response.statusCode == 200) {
  //     print('주문 추가 성공!');
  //   } else {
  //     throw Exception(
  //       '주문 추가 실패: ${response.statusCode}, message: ${response.data}',
  //     );
  //   }
  // }

  Future<void> cancelOrder(String id) async {
    final orderCancelDTO = OrderCancelRequest(detailReason: '사용자 취소', reason: '취소');
    final response = await _dio.post(Api.mypage.cancelOrder(id), data: orderCancelDTO.toJson());
    if (response.statusCode == 200) {
      print('주문 취소 성공!');
    } else {
      throw Exception(
        '주문 취소 실패: ${response.statusCode}, message: ${response.data}',
      );
    }
  }
  
  // Future<void> updateOrder(String id) async {
  //   final response = await _dio.patch(Api.order.updateOrder(id));
  //   if (response.statusCode == 200) {
  //     print('배송 상태 변경 성공!');
  //   } else {
  //     throw Exception(
  //       '배송 상태 변경 실패: ${response.statusCode}, message: ${response.data}',
  //     );
  //   }
  // }
}
import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';

class OrderService {
  final Dio _dio;
  OrderService(this._dio);
  
  Future<List<OrderDTO>> getOrder() async {
    final response = await _dio.get(Api.mypage.getOrders());
    final data = response.data as List;
    return data.map((e) => OrderDTO.fromJson(e)).toList();
  }
  
  Future<OrderDTO> getOrderDetail(String id) async {
    final response = await _dio.get(Api.order.getOrderDetail(id));
    final data = response.data;
    return OrderDTO.fromJson(data);
  }
  
  Future<void> addOrder(OrderDTO order) async {
    final response = await _dio.post(Api.order.createOrder);
    if (response.statusCode == 200) {
      print('주문 추가 성공!');
    } else {
      throw Exception(
        '주문 추가 실패: ${response.statusCode}, message: ${response.data}',
      );
    }
  }

  Future<void> cancelOrder(String id) async {
    final response = await _dio.patch(Api.mypage.cancelOrder(id));
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
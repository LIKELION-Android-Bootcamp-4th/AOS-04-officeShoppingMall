import 'package:office_shopping_mall/feature/order/data/order_add_requset.dart';

import '../../../../../core/data/models/dto/order_dto.dart';

abstract class OrderRepository {
  Future<List<OrderDTO>> getOrders();
  Future<OrderDTO> getOrderDetail(String id);
  Future<void> addOrder(OrderAddRequest request);
  Future<void> cancelOrder(String id);
}

import '../../../../../core/data/models/dto/order_dto.dart';

abstract class OrderRepository {
  Future<List<OrderDTO>> getOrder();
  Future<OrderDTO> getOrderDetail(String id);
  Future<void> addOrder(OrderDTO order);
  Future<void> cancelOrder(String id);
  // Future<void> updateOrder(String id);
}

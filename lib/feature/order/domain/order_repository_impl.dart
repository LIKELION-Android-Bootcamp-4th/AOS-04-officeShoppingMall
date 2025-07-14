import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/feature/order/data/order_service.dart';
import 'package:office_shopping_mall/feature/order/domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderService _service;
  OrderRepositoryImpl(this._service);

  @override
  Future<List<OrderDTO>> getOrder() {
    return _service.getOrder();
  }

  @override
  Future<OrderDTO> getOrderDetail(String id) {
    return _service.getOrderDetail(id);
  }

  @override
  Future<void> addOrder(OrderDTO order) {
    return _service.addOrder(order);
  }

  @override
  Future<void> cancelOrder(String id) {
    return _service.cancelOrder(id);
  }

  // @override
  // Future<void> updateOrder(String id) {
  //   return _service.updateOrder(id);
  // }
}
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/feature/order/data/order_add_requset.dart';
import 'package:office_shopping_mall/feature/order/data/order_service.dart';
import 'package:office_shopping_mall/feature/order/domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderService _service;
  OrderRepositoryImpl(this._service);

  @override
  Future<List<OrderDTO>> getOrders() {
    return _service.getOrders();
  }

  @override
  Future<OrderDTO> getOrderDetail(String id) {
    return _service.getOrderDetail(id);
  }

  @override
  Future<void> addOrder(OrderAddRequest request) {
    return _service.addOrder(request);
  }

  @override
  Future<void> cancelOrder(String id) {
    return _service.cancelOrder(id);
  }
}
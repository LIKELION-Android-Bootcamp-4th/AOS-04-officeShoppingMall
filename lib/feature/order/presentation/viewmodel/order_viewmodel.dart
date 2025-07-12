import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/feature/order/data/order_service.dart';
import 'package:office_shopping_mall/feature/order/domain/repository/order_repository.dart';

class OrderViewModel extends ChangeNotifier {
  final OrderRepository _repository;
  final OrderService _service;

  OrderViewModel(this._repository, this._service);

  List<OrderDTO> orders = [];
  bool _isLoading = false;

  Future<void> loadOrders() async {
    _isLoading = true;
    orders.clear();
    notifyListeners();

    try {
      final orderList = await _repository.getOrder();
      orders.addAll(orderList);
    } catch (e) {
      print('불러오기 실패: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> cancelOrder(String orderId) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _service.cancelOrder(orderId);
      orders.removeWhere((order) => order.orderId == orderId);
    } catch (e) {
      print('취소 실패: $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}
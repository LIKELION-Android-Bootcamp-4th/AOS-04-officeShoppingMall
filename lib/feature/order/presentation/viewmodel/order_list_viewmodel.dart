import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/feature/order/data/order_service.dart';
import 'package:office_shopping_mall/feature/order/domain/repository/order_repository.dart';

class OrderListViewModel extends ChangeNotifier {
  final OrderRepository _repository;
  final OrderService _service;

  OrderListViewModel(this._repository, this._service);

  List<OrderDTO> orders = [];
  bool _isLoading = false;

  Future<void> loadOrders() async {
    _isLoading = true;
    orders.clear();
    notifyListeners();

    try {
      final orderList = await _repository.getOrders();
      print('$orderList');
      orders.addAll(orderList);
    } catch (e, stack) {
      print('불러오기 실패: $e');
      print('불러오기 실패: $stack');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> cancelOrder(String id) async {
    _isLoading = true;
    orders.clear();
    notifyListeners();

    try {
      await _repository.cancelOrder(id);
      orders.removeWhere((order) => order.orderId == id);
    } catch (e, stack) {
      print('불러오기 실패: $e');
      print('불러오기 실패: $stack');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
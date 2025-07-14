import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/feature/order/data/order_service.dart';
import 'package:office_shopping_mall/feature/order/domain/repository/order_repository.dart';

class OrderDetailViewModel extends ChangeNotifier {
  final OrderRepository _repository;
  final OrderService _service;

  OrderDetailViewModel(this._repository, this._service);

  OrderDTO? order = null;
  bool _isLoading = false;

  Future<void> loadOrderId(String orderId) async {
    _isLoading = true;
    order = null;
    notifyListeners();

    try {
      final order = await _repository.getOrderDetail(orderId);
      print('$order');
      this.order = order;
      _isLoading = false;
      notifyListeners();
    } catch (e,stack) {
      print('불러오기 실패: $e');
      print('불러오기 실패: $stack');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

//   Future<void> cancelOrder(String orderId) async {
//     _isLoading = true;
//     notifyListeners();
//     try {
//       await _service.cancelOrder(orderId);
//       orders.removeWhere((order) => order.orderId == orderId);
//     } catch (e) {
//       print('취소 실패: $e');
//     }
//     _isLoading = false;
//     notifyListeners();
//   }
}
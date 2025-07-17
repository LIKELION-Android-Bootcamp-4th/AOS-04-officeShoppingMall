import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';
import 'package:office_shopping_mall/feature/order/domain/repository/order_repository.dart';
import 'package:office_shopping_mall/feature/payment/domain/order_info.dart';

class OrderDetailViewModel extends ChangeNotifier {
  final OrderRepository _repository;

  OrderDetailViewModel(this._repository);

  OrderDTO? order = null;
  bool _isLoading = false;
  String orderId = "";

  Future<void> loadOrderDetail() async {
    print('loadOrderDetail: $orderId');
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

  Future<void> setCurrentOrder(String orderId) async {
    this.orderId = orderId;
  }
}
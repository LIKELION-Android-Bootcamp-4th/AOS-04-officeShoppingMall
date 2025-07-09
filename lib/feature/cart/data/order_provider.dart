import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/order_dto.dart';

class OrderProvider with ChangeNotifier {
  List<OrderDTO> orders = [];

  void removeOrder(OrderDTO order) {
    orders.remove(order);
    notifyListeners();
  }
}
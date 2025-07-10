import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/cart_dto.dart';

class CartProvider with ChangeNotifier {
  List<CartDTO> carts = [];

  void addCart(CartDTO cart) {
    carts.add(cart);
    notifyListeners();
  }

  void removeCart(CartDTO cart) {
    carts.remove(cart);
    notifyListeners();
  }
}
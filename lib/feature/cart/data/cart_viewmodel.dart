import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/data/models/dto/cart_dto.dart';

class CartViewModel extends ChangeNotifier {
  final _cartRepository;

  CartDTO? selectedCart;

  CartViewModel(this._cartRepository);
  Future<void> setSelectesCart (CartDTO cart) async {
    selectedCart = cart;
    notifyListeners();
  }
}
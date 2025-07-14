import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_Item_response.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_item_request.dart';
import 'package:office_shopping_mall/feature/cart/domain/repository/cart_repository.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository _repository;
  final CartService _service;

  List<CartItemResponse> carts = [];
  bool _isLoading = false;
  final Set<String> _selectedCartIds = {};

  CartViewModel(this._repository, this._service);

  String? get error => _error;

  List<CartItemResponse> get selectedCarts =>
      carts.where((carts) => _selectedCartIds.contains(carts.id)).toList();

  bool isSelected(String cartId) => _selectedCartIds.contains(cartId);

  Future<void> loadCarts() async {
    _isLoading = true;
    carts.clear();
    notifyListeners();

    try {
      final cartList = await _repository.getCart();
      carts.addAll(cartList);
    } catch (e) {
      print('불러오기 실패: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteCart(String cartId) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _service.deleteCart(cartId);
      carts.removeWhere((cart) => cart.cartId == cartId);
    } catch (e) {
      print('삭제 실패: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  void toggleCarts (String cartId) {
    if (_selectedCartIds.contains(cartId)) {
      _selectedCartIds.remove(cartId);
    } else {
      _selectedCartIds.add(cartId);
    }
    notifyListeners();
  }

  void clearCarts() {
    _selectedCartIds.clear();
    notifyListeners();
  }

  int get selectedTotalPrice {
    return selectedCarts.fold(0, (sum, carts) => sum + carts.product.price);
  }
}

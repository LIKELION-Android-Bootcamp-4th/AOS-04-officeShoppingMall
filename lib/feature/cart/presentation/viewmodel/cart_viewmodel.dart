import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_Item_response.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_item_request.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_order_request.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_order_response.dart';
import 'package:office_shopping_mall/feature/cart/domain/repository/cart_repository.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository _repository;

  List<CartItemResponse> carts = [];
  bool _isLoading = false;
  String? _error;
  final Set<String> _selectedCartIds = {};

  CartViewModel(this._repository) {
    loadCarts();
  }

  bool get isLoading => _isLoading;

  String? get error => _error;

  List<CartItemResponse> get selectedCarts =>
      carts.where((carts) => _selectedCartIds.contains(carts.id)).toList();

  bool isSelected(String cartId) => _selectedCartIds.contains(cartId);

  int get getSelectedTotalPrice =>
      selectedCarts.fold(0, (sum, item) => sum + item.totalPrice);

  Future<void> loadCarts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final dtos = await _repository.getCart();
      carts = dtos;
    } catch (e) {
      _error = e.toString();
      print('Cart loading error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteCart(String cartItemId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _repository.deleteCart(cartItemId);
      carts.removeWhere((c) => c.id == cartItemId);
      _selectedCartIds.remove(cartItemId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleCarts(String cartId) {
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

  Future<void> updateQuantity(String cartItemId, int quantity) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _repository.updateCart(cartItemId, quantity);
      final idx = carts.indexWhere((c) => c.id == cartItemId);
      if (idx != -1) {
        final old = carts[idx];
        carts[idx] = old.copyWith(
          quantity: quantity,
          totalPrice: old.unitPrice * quantity,
        );
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addToCart({
    required String productId,
    required int quantity,
    required int unitPrice,
    Map<String, String>? options,
    Discount? discount,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final req = CartItemRequest(
        productId: productId,
        quantity: quantity,
        unitPrice: unitPrice,
        options: options ?? {},
        discount: discount,
      );
      final newItem = await _repository.addCart(req);
      final idx = carts.indexWhere((c) => c.id == newItem.id);
      if (idx != -1) {
        carts[idx] = newItem;
      } else {
        carts.add(newItem);
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<CartOrderResponseDTO?> orderFromCart({
    required List<String> cartIds,
    required String recipient,
    required String address,
    required String phone,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final request = CartOrderRequestDTO(
        cartIds: cartIds,
        shippingInfo: ShippingInfo(
          recipient: recipient,
          address: address,
          phone: phone,
        ),
      );

      final response = await _repository.orderFromCart(request);

      _selectedCartIds.clear(); //주문 생성 성공 시 선택을 초기화시킴
      notifyListeners();

      return response;
    } catch (e) {
      _error = e.toString();
      print('vm장바구니에서 주문 생성 중 오류 발생 $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

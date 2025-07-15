import 'package:office_shopping_mall/feature/cart/data/cart_Item_response.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_item_request.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_order_request.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_order_response.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_service.dart';
import 'package:office_shopping_mall/feature/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService _service;

  CartRepositoryImpl(this._service);

  @override
  Future<List<CartItemResponse>> getCart() {
    return _service.getCart();
  }

  @override
  Future<CartItemResponse> addCart(CartItemRequest request) {
    return _service.addCart(request);
  }

  @override
  Future<void> deleteCart(String id) {
    return _service.deleteCart(id);
  }

  @override
  Future<CartOrderResponseDTO> orderFromCart(CartOrderRequestDTO request) {
    return _service.orderFromCart(request);
  }

  @override
  Future<void> updateCart(String id, int quantity) {
    return _service.updateCart(id, quantity);
  }
}

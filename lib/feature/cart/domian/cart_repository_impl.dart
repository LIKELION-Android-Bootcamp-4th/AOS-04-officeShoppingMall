import 'package:office_shopping_mall/core/data/models/dto/cart_dto.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_service.dart';
import 'package:office_shopping_mall/feature/cart/domian/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService _service;
  CartRepositoryImpl(this._service);

  @override
  Future<List<CartDTO>> getCart() {
    return _service.getCart();
  }

  @override
  Future<void> addCart(CartDTO cart) {
    return _service.addCart(cart);
  }

  @override
  Future<void> deleteCart(String id) {
    return _service.deleteCart(id);
  }
  @override
  Future<void> updateCart(String id, int quantity) {
    return _service.updateCart(id, quantity);
  }
}
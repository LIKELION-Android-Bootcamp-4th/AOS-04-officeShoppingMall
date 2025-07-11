import '../../../../../core/data/models/dto/cart_dto.dart';

abstract class CartRepository {
  Future<List<CartDTO>> getCart();
  Future<void> addCart (CartDTO cart);
  Future<void> deleteCart (String id);
  Future<void> updateCart (String id, int quantity);
}
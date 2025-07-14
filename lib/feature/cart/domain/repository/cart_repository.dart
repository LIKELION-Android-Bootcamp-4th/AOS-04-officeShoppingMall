import 'package:office_shopping_mall/feature/cart/data/cart_Item_response.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_item_request.dart';

import '../../../../../core/data/models/dto/cart_dto.dart';

abstract class CartRepository {
  Future<List<CartItemResponse>> getCart();

  Future<CartItemResponse> addCart(CartItemRequest request);

  Future<void> deleteCart(String id);

  Future<void> updateCart(String id, int quantity);
}

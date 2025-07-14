import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/cart_dto.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_Item_response.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_item_request.dart';

class CartService {
  final Dio _dio;

  CartService(this._dio);

  Future<List<CartDTO>> getCart() async {
    final response = await _dio.get(Api.cart.getCart());
    final data = response.data as List;
    return data.map((e) => CartDTO.fromJson(e)).toList();
  }

  Future<CartItemResponse> addCart(CartItemRequest req) async {
    final response = await _dio.post(Api.cart.addCart(), data: req.toJson());

    if (response.statusCode == 200) {
      final cartAdd = CartAddResponse.fromJson(response.data as Map<String, dynamic>);
      return cartAdd.data.item;
    } else {
      throw Exception('장바구니 추가 실패: ${response.statusCode}, message: ${response.data}');
    }
  }

  Future<void> deleteCart(String id) async {
    final response = await _dio.delete(Api.cart.deleteCart(id));
    if (response.statusCode == 200) {
      print('장바구니 상품 삭제 성공!');
    } else {
      throw Exception('장바구니 삭제 실패: ${response.statusCode}, message: ${response.data}');
    }
  }

  Future<void> updateCart(String id, int quantity) async {
    final response = await _dio.patch(Api.cart.updateCart(id), data: {'quantity': quantity});

    if (response.statusCode == 200) {
      print('장바구니 상품 수정 성공!');
    } else {
      throw Exception('장바구니 상품 수정 실패: ${response.statusCode}, message: ${response.data}');
    }
  }
}

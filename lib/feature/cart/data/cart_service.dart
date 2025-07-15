import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_Item_response.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_item_request.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_order_request.dart';
import 'package:office_shopping_mall/feature/cart/data/cart_order_response.dart';

class CartService {
  final Dio _dio;

  CartService(this._dio);

  Future<List<CartItemResponse>> getCart() async {
    final response = await _dio.get(Api.cart.getCart());
    print('서버 응답 전체: ${response.data}');

    final items = response.data['data']['items'] as List;

    return items.map((e) => CartItemResponse.fromJson(e)).toList();
  }

  Future<CartItemResponse> addCart(CartItemRequest req) async {
    final response = await _dio.post(Api.cart.addCart(), data: req.toJson());

    if (response.statusCode == 200) {
      final cartAdd = CartAddResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
      return cartAdd.data.item;
    } else {
      throw Exception(
        '장바구니 추가 실패: ${response.statusCode}, message: ${response.data}',
      );
    }
  }

  Future<void> deleteCart(String id) async {
    final response = await _dio.delete(
      Api.cart.deleteCart,
      data: {
        "cartIds": [id],
      },
    );

    if (response.statusCode == 200) {
      print('장바구니 상품 삭제 성공!');
    } else {
      throw Exception(
        '장바구니 삭제 실패: ${response.statusCode}, message: ${response.data}',
      );
    }
  }

  Future<CartOrderResponseDTO> orderFromCart(CartOrderRequestDTO request) async{
    try{
      final response = await _dio.post(Api.cart.checkout,
      data: request.toJson());

      if(response.statusCode == 201){
        return CartOrderResponseDTO.fromJson(response.data);
      }else{
        throw Exception("장바구니에서 주문 생성 실패: ${response.statusCode} \n ${response.data}");
      }
    }catch (e){
      throw Exception("장바구니에서 주문 생성 중 문제 발생: $e");
    }
  }



  Future<void> updateCart(String id, int quantity) async {
    final response = await _dio.patch(
      Api.cart.updateCart(id),
      data: {'quantity': quantity},
    );

    if (response.statusCode == 200) {
      print('장바구니 상품 수정 성공!');
    } else {
      throw Exception(
        '장바구니 상품 수정 실패: ${response.statusCode}, message: ${response.data}',
      );
    }
  }
}

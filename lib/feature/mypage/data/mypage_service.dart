import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/dto/toggle_favorite_response.dart';
import 'package:office_shopping_mall/core/data/models/dto/user_dto.dart';
import 'package:office_shopping_mall/core/data/network/api_client.dart';

class MypageService {
  final Dio _dio = ApiClient().dio;

  Future<UserDTO> fetchUser() async {
    final response = await _dio.get(Api.mypage.getProfile);
    return UserDTO.fromJson(response.data['data']);
  }

  Future<List<ProductDTO>> fetchRecent({required int page, required int limit}) async {
    final response = await _dio.get(Api.mypage.getRecentProducts(page: page, limit: limit));
    final items = response.data['data']['items'] as List<dynamic>;
    return items.map((raw) {
      final map = raw as Map<String, dynamic>;
      final productJson = map['productId'] as Map<String, dynamic>;
      return ProductDTO.fromJson(productJson);
    }).toList();
  }

  Future<ToggleFavoriteResponse> toggleFavorite(String productId) async {
    final response = await _dio.post(Api.product.toggleFavorite(productId));

    if (response.statusCode == 200) {
      return ToggleFavoriteResponse.fromJson(response.data);
    }
    throw Exception(response.statusCode);
  }
}

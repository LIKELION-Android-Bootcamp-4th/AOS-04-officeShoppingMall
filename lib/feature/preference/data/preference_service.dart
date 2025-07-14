import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/dto/toggle_favorite_response.dart';
import 'package:office_shopping_mall/core/data/network/api_client.dart';

class PreferenceService {
  final Dio _dio = ApiClient().dio;

  Future<List<ProductDTO>> getPreference({
    int? page,
    int? limit,
    String? sort,
    String? order,
  }) async {
    final response = await _dio.get(
      Api.mypage.getFavorites(
        page: page ?? 1,
        limit: limit ?? 20,
        sort: sort ?? 'createdAt',
        order: order ?? 'desc',
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data['data'] as Map<String, dynamic>;
      final items = data['items'] as List<dynamic>? ?? [];
      return items.map((raw) {
        final item = raw as Map<String, dynamic>;
        final entityJson = item['entity'] as Map<String, dynamic>? ?? {};
        return ProductDTO.fromJson({
          ...entityJson,

          'id': entityJson['id'] ?? '',
          'isFavorite': true,
          'favoriteCount': entityJson['likeCount'] ?? 0,
        });
      }).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<ToggleFavoriteResponse> toggleFavorite(String productId) async {
    final response = await _dio.post(Api.product.toggleFavorite(productId));

    if (response.statusCode == 200) {
      return ToggleFavoriteResponse.fromJson(response.data);
    }
    throw Exception(response.statusCode);
  }
}

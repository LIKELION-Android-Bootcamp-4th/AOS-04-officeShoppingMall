import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/network/api_client.dart';

class HomeService {
  final Dio _dio = ApiClient().dio;

  Future<List<ProductDTO>> getProducts({
    int? page,
    int? limit,
    String? category,
    String? search,
    String? sortBy,
  }) async {
    final response = await _dio.get(
      Api.product.getProducts(
        page: page = 1,
        limit: limit = 20,
        category: category,
        search: search,
        sortBy: sortBy,
      ),
    );

    if (response.statusCode == 200) {
      final items = response.data['data']['items'] as List;
      return items.map((item) => ProductDTO.fromJson(item)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}

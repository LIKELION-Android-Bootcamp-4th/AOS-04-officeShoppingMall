import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
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
        order: order ??'desc',
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

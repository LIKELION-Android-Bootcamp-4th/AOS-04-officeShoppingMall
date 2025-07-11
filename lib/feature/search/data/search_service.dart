import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/network/api_client.dart';
import 'package:office_shopping_mall/feature/search/data/popular/popular_data_dto.dart';
import 'package:office_shopping_mall/feature/search/data/popular/popular_response.dart';

class SearchService {
  final Dio _dio = ApiClient().dio;

  Future<List<ProductDTO>> searchProducts(String query) async {
    final url = Api.search.integrated(query);

    try {
      final response = await _dio.get(url);
      final success = response.data['success'] ?? false;

      if (!success) {
        final message = response.data['message'] ?? '검색에 실패했습니다.';
        throw Exception(message);
      }

      final List<dynamic> items =
          response.data['data']?['products']?['items'] ?? [];
      return items.map((e) => ProductDTO.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final message = e.response?.data['message'] ?? '잘못된 요청입니다.';
        throw Exception(message);
      }
      throw Exception("오류가 발생했습니다.");
    } catch (e) {
      throw Exception("오류가 발생했습니다.");
    }
  }

  Future<PopularDataDto> fetchPopularKeyword() async {
    try {
      final response = await _dio.get(Api.keyword.getPopular());

      if (response.statusCode == 200) {
        final popularResponse = PopularResponse.fromJson(
          response.data as Map<String, dynamic>,
        );

        if (popularResponse.success) {
          return popularResponse.data!;
        } else {
          throw Exception('조회 실패(success != true): ${popularResponse.message}');
        }
      } else {
        throw Exception('조회 실패(code != 200): ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio Exception');
    } catch (e) {
      throw Exception('error');
    }
  }
}

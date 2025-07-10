import 'package:dio/dio.dart';
import 'package:office_shopping_mall/core/constants/api_endpoints.dart';
import 'package:office_shopping_mall/core/data/network/api_client.dart';
import 'package:office_shopping_mall/feature/search/data/popular/popular_data_dto.dart';
import 'package:office_shopping_mall/feature/search/data/popular/popular_response.dart';

class SearchService {
  final Dio _dio = ApiClient().dio;

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

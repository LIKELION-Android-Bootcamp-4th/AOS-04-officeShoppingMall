import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/data/models/dto/review_dto.dart';
import '../../../core/data/network/api_client.dart';

class ReviewService{
  final Dio _dio = ApiClient().dio;

  Future<void> addReview(ReviewDTO reviewDTO, String productId) async {
    final response = await _dio.post(
      Api.product.writeReview(productId),
      data: reviewDTO.toJson(),
    );

    if (response.statusCode != 200) {
      throw Exception("리뷰 작성에 실패했습니다: ${response.statusCode}");
    }
  }

  Future<List<ReviewDTO>> getReviews(String productId) async {
    final response = await _dio.get(Api.product.getReviews(productId));

    if (response.statusCode == 200 && response.data['data'] != null) {
      final List<dynamic> list = response.data['data'];
      return list.map((json) => ReviewDTO.fromJson(json)).toList();
    } else {
      throw Exception("리뷰 목록을 불러오는 데 실패했습니다: ${response.statusCode}");
    }
  }




}
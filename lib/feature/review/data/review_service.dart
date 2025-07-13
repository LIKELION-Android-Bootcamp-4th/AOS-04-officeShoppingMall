import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/data/models/dto/review_dto.dart';

class ReviewService{
  final Dio _dio;

  ReviewService(this._dio);

  Future<void> addReview(ReviewDTO reviewDTO, String productId) async {
    final response = await _dio.post(
      Api.product.writeReview(productId),
      data: reviewDTO.toJson(),
    );

    if (response.statusCode != 201) {
      throw Exception("리뷰 작성에 실패했습니다: ${response.statusCode}");
    }
  }

  Future<List<ReviewDTO>> getReviews(String productId) async {
    final response = await _dio.get(Api.product.getReviews(productId));

    if (response.statusCode == 200 && response.data['data'] != null) {
      final items = response.data['data']['items'];

      if (items is List) {
        return items
            .map<ReviewDTO>((json) => ReviewDTO.fromJson(Map<String, dynamic>.from(json)))
            .toList();
      } else {
        throw Exception("리뷰 데이터 형식이 올바르지 않습니다: items가 List가 아닙니다");
      }
    } else {
      throw Exception("리뷰 목록을 불러오는 데 실패했습니다: ${response.statusCode}");
    }
  }

  Future<List<ReviewDTO>> getMyReviews() async {
    final response = await _dio.get(Api.mypage.getMyReviews());
    if (response.statusCode == 200 && response.data['data'] != null) {
      final items = response.data['data']['items'];
      if (items is List) {
        return items
            .map<ReviewDTO>((json) => ReviewDTO.fromJson(Map<String, dynamic>.from(json)))
            .toList();
      } else {
        throw Exception("리뷰 데이터 형식이 올바르지 않습니다: items가 List가 아닙니다");
      }
    } else {
      throw Exception("리뷰 목록을 불러오는 데 실패했습니다: ${response.statusCode}");

      }
  }




}
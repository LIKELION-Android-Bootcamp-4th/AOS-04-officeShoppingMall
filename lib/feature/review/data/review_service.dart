
import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/data/models/dto/review_dto.dart';
import '../../../core/data/network/api_client.dart';

class ReviewService{
  final Dio _dio = ApiClient().dio;

  Future<ReviewDTO> getReviews(String productId) async {
    final response = await _dio.get(Api.product.getReviews(productId));
    return ReviewDTO.fromJson(response.data['data']);
  }




}
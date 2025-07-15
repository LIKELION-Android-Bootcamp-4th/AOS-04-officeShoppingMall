import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/data/models/dto/review_dto.dart';
import '../../../core/data/models/entity/product.dart';
import '../../product/domain/repository/product_repository.dart';

class ReviewService {
  final Dio _dio;
  final ProductRepository _productRepository;

  ReviewService(this._dio, this._productRepository);

  Future<void> addReview(
      ReviewCreateDTO reviewDTO,
      List<XFile?> images,
      String productId,
      ) async {
    final formData = await buildReviewFormData(reviewDTO, images);

    final response = await _dio.post(
      Api.product.writeReview(productId),
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    if (response.statusCode != 201) {
      throw Exception("리뷰 작성에 실패했습니다: ${response.statusCode}");
    }
  }

  Future<FormData> buildReviewFormData(
      ReviewCreateDTO dto,
      List<XFile?> images,
      ) async {
    final List<MultipartFile> imageFiles = [];

    for (final image in images.where((e) => e != null)) {
      imageFiles.add(await MultipartFile.fromFile(
        image!.path,
        filename: image.name,
      ));
    }

    final formData = FormData.fromMap({
      ...dto.toJson(),
      "images": imageFiles,
    });

    return formData;
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
import 'package:image_picker/image_picker.dart';
import 'package:office_shopping_mall/core/data/models/dto/review_dto.dart';
import 'package:office_shopping_mall/feature/review/data/review_service.dart';

class ReviewRepository {
  final ReviewService _service;

  ReviewRepository(this._service);

  Future<void> addReview(
      ReviewCreateDTO reviewDTO,
      List<XFile?> images,
      String productId,
      ) async {
    await _service.addReview(reviewDTO, images, productId);
  }

  Future<List<ReviewDTO>> getReviews(String productId) async {
    return await _service.getReviews(productId);
  }

  Future<List<ReviewDTO>> getMyReviews() async {
    return await _service.getMyReviews();
  }
}

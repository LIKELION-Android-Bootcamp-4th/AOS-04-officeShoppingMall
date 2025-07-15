import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/data/models/dto/review_dto.dart';
import '../../../../core/data/models/entity/product.dart';
import '../../../../core/data/models/entity/user.dart';
import '../../data/review_repository.dart';
import '../../data/review_service.dart';

class ReviewModel extends ChangeNotifier {
  final TextEditingController reviewController = TextEditingController();
  final List<SvgPicture?> score = List.generate(
    5,
    (index) => SvgPicture.asset("images/icon/ic_star_large_1.svg"),
  );
  int scoreValue = 5;
  final List<XFile?> images = [];
  final ImagePicker _picker = ImagePicker();
  final int visibleCount = 3;
  List<ReviewDTO> reviews = [];
  ReviewDTO? selectedReview;
  Product? selectedProduct;
  double? productScore;
  bool isLoading = false;

  final ReviewRepository _reviewRepository;

  ReviewModel(this._reviewRepository);

  void onScoreSelected(int index) {
    for (int i = 0; i < score.length; i++) {
      if (i <= index) {
        score[index] = SvgPicture.asset("images/icon/ic_star_large_1.svg");
      } else {
        score[index] = SvgPicture.asset("images/icon/ic_star_large_0.svg");
      }
    }
    scoreValue = index + 1;
    notifyListeners();
  }

  Future<void> pickImage(int index) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (index < images.length) {
        images[index] = pickedFile;
      } else {
        images.add(pickedFile);
      }
    }
    notifyListeners();
  }

  ReviewCreateDTO createReview({required Product product}) {
    return ReviewCreateDTO(
      productId: product.id,
      orderId: null,
      rating: scoreValue,
      comment: reviewController.text,
    );
  }

  Future<void> addReview(ReviewCreateDTO reviewDTO) async {
    await _reviewRepository.addReview(reviewDTO, images, reviewDTO.productId);
  }

  Future<void> getReviews(String productId) async {
    reviews.clear();
    productScore = 0.0;
    isLoading = true;
    notifyListeners();

    try {
      final reviewList = await _reviewRepository.getReviews(productId);
      reviews.addAll(reviewList);

      double score = 0.0;
      if (reviewList.isNotEmpty) {
        for (final review in reviewList) {
          score += review.rating;
        }
        score = score / reviewList.length;
      }
      productScore = score;
    } catch (e) {
      print('Error loading reviews: $e');
      productScore = 0.0;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getMyReview() async {
    reviews.clear();

    try {
      final reviewList = await _reviewRepository.getMyReviews();
      reviews.addAll(reviewList);
    } catch (e) {
      print('Error loading reviews: $e');
    }
    notifyListeners();
  }
}

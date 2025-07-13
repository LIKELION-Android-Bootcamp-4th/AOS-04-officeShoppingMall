import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:office_shopping_mall/core/data/models/dto/review_dto.dart';
import '../../../../core/data/models/dto/product_dto.dart';
import '../../../../core/data/models/entity/user.dart';
import '../../data/review_repository.dart';

class ReviewModel extends ChangeNotifier{
  final TextEditingController reviewController = TextEditingController();
  final List<SvgPicture?> score = List.generate(5, (index) => SvgPicture.asset(""));
  int scoreValue = 5;
  final List<XFile?> images = [];
  final ImagePicker _picker = ImagePicker();
  final int visibleCount = 3;
  List<ReviewDTO> reviews = [];
  ReviewDTO? selectedReview;

  final ReviewRepository _reviewRepository;

  ReviewModel(this._reviewRepository);

  void onScoreSelected(int index) {
    for(int i = 0; i < score.length; i++) {
      if (i <= index) {
        score[index] = SvgPicture.asset("");
      }
      else {
        score[index] = SvgPicture.asset("");
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

  ReviewDTO createReview({required ProductDTO product, required User user}) {
    final reviewDTO = ReviewDTO(
      id: "",
      productId: product.id,
      userId: user.id,
      rating: scoreValue,
      comment: reviewController.text,
      images: images.map((e) => ReviewImageDTO(
        id: "",
        originalName: e!.name,
        url: e.path,
        mimeType: "",
        size: 0,
      )).toList(),
      createdAt: DateTime.now(),
    );

    return reviewDTO;
  }

  Future<void> addReview(ReviewDTO reviewDTO) async {
    await _reviewRepository.addReview(reviewDTO, reviewDTO.productId);
  }

  Future<void> getReviews(String productId) async {
    reviews.clear();

    try {
      final reviewList = await _reviewRepository.getReviews(productId);
      reviews.addAll(reviewList);
    }
    catch (e) {
      print('Error loading reviews: $e');
    }
    notifyListeners();
  }

  Future<void> getMyReview() async {
    reviews.clear();

    try {
      final reviewList = await _reviewRepository.getMyReviews();
      reviews.addAll(reviewList);
    }
    catch (e) {
      print('Error loading reviews: $e');
    }
    notifyListeners();
  }
}
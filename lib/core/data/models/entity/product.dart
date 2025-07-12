import '../dto/product_dto.dart';

class Product{
  final String id;
  final String name;
  final String? description;
  final String category;
  final int price;
  final String? thumbnailImage;
  final List<String> images;
  final double? score;

  Product({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    required this.price,
    this.thumbnailImage,
    this.images = const [],
    this.score,
  });

  factory Product.fromDTO(ProductDTO dto){
    return Product(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      category: dto.category,
      price: dto.price,
      thumbnailImage: dto.thumbnailImage,
      images: dto.images,
      score: dto.score,
    );
  }

  ProductDTO toDTO(){
    return ProductDTO(
      id: id,
      name: name,
      description: description,
      category: category,
      price: price,
      stock: 0,
      thumbnailImage: thumbnailImage,
      images: images,
      favoriteCount: 0,
      viewCount: 0,
      orderCount: 0,
      reviewCount: 0,
      reviewStats: ReviewStats( averageRating: 0.0, totalReviews: 0, ratingDistribution: RatingDistribution(r1: 0, r2: 0, r3: 0, r4: 0, r5: 0)),
      score: score,
      isFavorite: false,
    );
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    int? price,
    String? thumbnailImage,
    List<String>? images,
    double? score,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      images: images ?? this.images,
      score: score ?? this.score,
    );
  }
}
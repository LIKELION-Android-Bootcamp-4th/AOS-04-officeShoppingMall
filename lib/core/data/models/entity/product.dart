import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';

class Product {
  final String id;
  final String name;
  final String? description;
  final String category;
  final int price;
  final int stock;
  final String? thumbnailImage;
  final List<String> images;
  final int favoriteCount;
  final int viewCount;
  final int orderCount;
  final int reviewCount;
  final ReviewStats reviewStats;
  final double? score;
  final List<String> reviews;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    required this.price,
    required this.stock,
    this.thumbnailImage,
    this.images = const [],
    required this.favoriteCount,
    required this.viewCount,
    required this.orderCount,
    required this.reviewCount,
    required this.reviewStats,
    this.score,
    this.reviews = const [],
    required this.isFavorite,
  });

  factory Product.fromDTO(ProductDTO dto) {
    return Product(
      id: dto.id,
      name: dto.name,
      category: dto.category,
      price: dto.price,
      stock: dto.stock,
      favoriteCount: dto.favoriteCount,
      viewCount: dto.viewCount,
      orderCount: dto.orderCount,
      reviewCount: dto.reviewCount,
      reviewStats: dto.reviewStats,
      isFavorite: dto.isFavorite,
    );
  }

  Product toDTO() {
    return Product(
      id: id,
      name: name,
      category: category,
      price: price,
      stock: stock,
      favoriteCount: favoriteCount,
      viewCount: viewCount,
      orderCount: orderCount,
      reviewCount: reviewCount,
      reviewStats: reviewStats,
      isFavorite: isFavorite,
    );
  }

  Product copyWith({bool? isFavorite}) {
    return Product(
      id: id,
      name: name,
      category: category,
      price: price,
      stock: stock,
      favoriteCount: favoriteCount,
      viewCount: viewCount,
      orderCount: orderCount,
      reviewCount: reviewCount,
      reviewStats: reviewStats,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

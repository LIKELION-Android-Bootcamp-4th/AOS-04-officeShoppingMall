import 'dart:convert';

class ProductDTO {
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

  ProductDTO({
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

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    double? parsedScore;
    List<String> parsedReviews = [];

    final attr = json['attributes'];
    if (attr != null && attr is String && attr.isNotEmpty) {
      try {
        final fixedAttr = attr.replaceAll("'", '"');
        final parsed = jsonDecode(fixedAttr);

        final scoreVal = parsed['score'];
        if (scoreVal != null) {
          parsedScore = (scoreVal as num).toDouble();
        }


        final reviewList = parsed['reviews'];
        if (reviewList != null && reviewList is List) {
          parsedReviews = reviewList.map((e) => e.toString()).toList();
        }
      } catch (e) {
        print('Error parsing attributes: $e');
      }
    }

    return ProductDTO(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] as String?,
      category: json['category'] as String,
      price: json['price'] ?? 0,
      stock: json['stock'] ?? 0,
      thumbnailImage: json['thumbnailImage'] as String?,
      images: (json['images'] is List)
          ? (json['images'] as List<dynamic>).map((e) => e.toString()).toList()
          : [],
      favoriteCount: json['favoriteCount'] ?? 0,
      viewCount: json['viewCount'] ?? 0,
      orderCount: json['orderCount'] ?? 0,
      reviewCount: json['reviewCount'] ?? 0,
      reviewStats: ReviewStats.fromJson(json['reviewStats'] ?? {}),
      isFavorite: json['isFavorite'] ?? false,
      score: parsedScore,
      reviews: parsedReviews,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'stock': stock,
      'thumbnailImage': thumbnailImage,
      'images': images,
      'attributes': jsonEncode({'score': score ?? 0, 'reviews': reviews}),
      'favoriteCount': favoriteCount,
      'viewCount': viewCount,
      'orderCount': orderCount,
      'reviewCount': reviewCount,
      'reviewStats': reviewStats.toJson(),
      'isFavorite': isFavorite,
    };
  }
}

class ReviewStats {
  final double averageRating;
  final int totalReviews;
  final RatingDistribution ratingDistribution;

  ReviewStats({
    required this.averageRating,
    required this.totalReviews,
    required this.ratingDistribution,
  });

  factory ReviewStats.fromJson(Map<String, dynamic> json) {
    return ReviewStats(
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      totalReviews: json['totalReviews'] ?? 0,
      ratingDistribution: RatingDistribution.fromJson(json['ratingDistribution'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'averageRating': averageRating,
    'totalReviews': totalReviews,
    'ratingDistribution': ratingDistribution.toJson(),
  };
}

class RatingDistribution {
  final int r1;
  final int r2;
  final int r3;
  final int r4;
  final int r5;

  RatingDistribution({
    required this.r1,
    required this.r2,
    required this.r3,
    required this.r4,
    required this.r5,
  });

  factory RatingDistribution.fromJson(Map<String, dynamic> json) {
    return RatingDistribution(
      r1: json['1'] ?? 0,
      r2: json['2'] ?? 0,
      r3: json['3'] ?? 0,
      r4: json['4'] ?? 0,
      r5: json['5'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {'1': r1, '2': r2, '3': r3, '4': r4, '5': r5};
}

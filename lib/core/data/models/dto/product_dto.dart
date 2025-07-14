import 'dart:convert';

String fixImagePath(String path) {
  if (path.startsWith('/uploads/')) {
    return 'http://git.hansul.kr:3004$path';
  }
  // 로컬 경로나 잘못된 경로는 빈 문자열 반환
  return path;
}

class ProductDTO {
  final String id;
  final String name;
  final String? description;
  final String category;
  final int price;
  final int stock;
  final ThumbnailImage? thumbnailImage;
  final String? contentImage;
  final List<String> images;
  final int favoriteCount;
  final int viewCount;
  final int orderCount;
  final int reviewCount;
  final ReviewStats reviewStats;
  final double? score;
  final bool isFavorite;

  ProductDTO({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    required this.price,
    required this.stock,
    this.thumbnailImage,
    this.contentImage,
    this.images = const [],
    required this.favoriteCount,
    required this.viewCount,
    required this.orderCount,
    required this.reviewCount,
    required this.reviewStats,
    this.score,
    required this.isFavorite,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    double? parsedScore;
    List<String> images = [];
    final imagesData = json['images'];

    if (imagesData is List) {
      images = imagesData
          .map((e) => fixImagePath(e.toString()))
          .where((e) => e.isNotEmpty)
          .toList();
    } else if (imagesData is String && imagesData.isNotEmpty) {
      try {
        final fixed = imagesData.replaceAll('{', '[').replaceAll('}', ']');
        final parsedList = jsonDecode(fixed) as List<dynamic>;
        images = parsedList
            .map((e) => fixImagePath(e.toString()))
            .where((e) => e.isNotEmpty)
            .toList();
      } catch (e) {
        print('Error parsing images string: $e');
        images = [];
      }
    }

    final attr = json['attributes'];
    if (attr != null) {
      if (attr is String && attr.isNotEmpty) {
        try {
          final fixedAttr = attr.replaceAll("'", '"');
          final parsed = jsonDecode(fixedAttr);
          final scoreVal = parsed['score'];
          if (scoreVal != null) {
            parsedScore = (scoreVal as num).toDouble();
          }
        } catch (e) {
          print('Error parsing attributes string: $e');
        }
      } else if (attr is Map<String, dynamic>) {
        final scoreVal = attr['score'];
        if (scoreVal != null) {
          parsedScore = (scoreVal as num).toDouble();
        }
      }
    }

    final thumbObj = json['thumbnailImage'] as Map<String, dynamic>?;
    final rawThumb = thumbObj?['url'] as String? ?? json['thumbnailImageUrl'] as String?;
    final thumbUrl = rawThumb != null ? fixImagePath(rawThumb) : null;

    final rawContent =
        (json['contentImage'] as Map<String, dynamic>?)?['url'] as String? ??
        json['contentImageUrl'] as String?;
    final contentUrl = rawContent != null ? fixImagePath(rawContent) : null;

    return ProductDTO(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] as String?,
      category: json['category'] ?? '',
      price: json['price'] ?? 0,
      stock: json['stock'] ?? 0,
      thumbnailImage: ThumbnailImage.fromJson(json['thumbnailImage'] ?? {}),
      contentImage: json['contentImage']?['url'] as String? ?? json['contentImageUrl'] as String?,
      images: images,
      favoriteCount: json['favoriteCount'] ?? 0,
      viewCount: json['viewCount'] ?? 0,
      orderCount: json['orderCount'] ?? 0,
      reviewCount: json['reviewCount'] ?? 0,
      reviewStats: ReviewStats.fromJson(json['reviewStats'] ?? {}),
      isFavorite: json['isFavorite'] ?? false,
      score: parsedScore,
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
      'contentImage': contentImage,
      'images': images,
      'attributes': jsonEncode({'score': score ?? 0}),
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

class ThumbnailImage {
  final String id;
  final String originalName;
  final String? filename;
  final String mimeType;
  final int? size;
  final String url;

  ThumbnailImage({
    required this.id,
    required this.originalName,
    this.filename,
    required this.mimeType,
    this.size,
    required this.url,
  });

  factory ThumbnailImage.fromJson(Map<String, dynamic> json) {
    return ThumbnailImage(
      id: json['id'] as String? ?? '',
      originalName: json['originalName'] ?? '',
      filename: json['filename'] as String?,
      mimeType: json['mimeType'] ?? '',
      size: json['size'] as int?,
      url: json['url'] ?? '',
    );
  }
}

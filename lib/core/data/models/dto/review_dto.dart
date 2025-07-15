import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';

class ReviewDTO {
  final String id;
  final String productId;
  final String userId;
  final int rating;
  final String comment;
  final List<ReviewImageDTO>? images;
  final DateTime? createdAt;
  final ProductDTO? product;

  ReviewDTO({
    required this.id,
    required this.productId,
    required this.userId,
    required this.rating,
    required this.comment,
    this.images,
    this.createdAt,
    this.product,
  });

  factory ReviewDTO.fromJson(Map<String, dynamic> json) {
    return ReviewDTO(
      id: json['id'] ?? '',
      productId: json['productId'] ?? '',
      userId: json['userId'] ?? '',
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      images: (json['images'] is List)
          ? (json['images'] as List<dynamic>).map((e) => ReviewImageDTO.fromJson(e)).toList()
          : [],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      product: json['product'] != null ? ProductDTO.fromJson(json['product']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'userId': userId,
      'rating': rating,
      'comment': comment,
      'images': images?.map((e) => e.toJson()).toList(),
      'createdAt': createdAt?.toIso8601String(),
      'product': product?.toJson(),
    };
  }

  ReviewDTO copyWith({
    String? id,
    String? productId,
    String? userId,
    int? rating,
    String? comment,
    List<ReviewImageDTO>? images,
    DateTime? createdAt,
    ProductDTO? product,
  }) {
    return ReviewDTO(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      product: product ?? this.product,
    );
  }
}

class ReviewImageDTO {
  final String id;
  final String originalName;
  final String url;
  final String mimeType;
  final int size;

  ReviewImageDTO({
    required this.id,
    required this.originalName,
    required this.url,
    required this.mimeType,
    required this.size,
  });

  factory ReviewImageDTO.fromJson(Map<String, dynamic> json) {
    return ReviewImageDTO(
      id: json['id'] ?? '',
      originalName: json['originalName'] ?? '',
      url: json['url'] ?? '',
      mimeType: json['mimeType'] ?? '',
        size: json['size'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'originalName': originalName,
      'url': url,
      'mimeType': mimeType,
      'size': size,
    };
  }
}

class ReviewCreateDTO {
  final String productId;
  final String? orderId;
  final int rating;
  final String comment;

  ReviewCreateDTO({
    required this.productId,
    this.orderId,
    required this.rating,
    required this.comment,
  });

  factory ReviewCreateDTO.fromJson(Map<String, dynamic> json) {
    return ReviewCreateDTO(
      productId: json['productId'] ?? '',
      orderId: json['orderId'] ?? '',
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "orderId": orderId,
      "rating": rating,
      "comment": comment,
    };
  }
}

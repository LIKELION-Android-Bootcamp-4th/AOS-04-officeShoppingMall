class ReviewDTO {
  final String id;
  final String productId;
  final String userId;
  final int rating;
  final String comment;
  final List<ReviewImageDTO>? images;
  final DateTime? createdAt;

  ReviewDTO({
    required this.id,
    required this.productId,
    required this.userId,
    required this.rating,
    required this.comment,
    this.images,
    this.createdAt,
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
  }) {
    return ReviewDTO(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
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

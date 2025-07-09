import 'dart:convert';

class Product {
  final String id;
  final String name;
  final int price;
  final String? description;
  final List<String> images;
  final String category;
  final double? score;
  final List<String> reviews;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.images = const [],
    required this.category,
    this.score,
    this.reviews = const [],
  });

  factory Product.fromJson(Map<String, dynamic> json) {
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

    return Product(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      description: json['description'] as String?,
      images: (json['images'] is List)
          ? (json['images'] as List<dynamic>).map((e) => e.toString()).toList()
          : [],
      category: json['category'] as String? ?? '',
      score: parsedScore,
      reviews: parsedReviews,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'images': images,
      'category': category,
      'attributes': jsonEncode({'score': score ?? 0, 'reviews': reviews}),
    };
  }
}

import 'package:office_shopping_mall/feature/product/data/product_repository.dart';

import '../../domain/i_product_repository.dart';

class Product {
  final String id;
  final String name;
  final int price;
  final String? description;
  final List<String>? imageUrl;
  final String categoryId;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageUrl,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      name: json['name'],
      price: json['price'],
      description: json['description'],
      imageUrl: json['images'] is List
          ? (json['images'] as List).map((e) => e.toString()).toList()
          : [],
      categoryId: json['attributes'] != null ? json['attributes']['category'] : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'images': imageUrl,
      'attributes': {
        'category': categoryId,
      },
    };
  }
}

String? getCategoryInfo(String categoryId) {
  switch (int.parse(categoryId)) {
    case 0:
      return "td / asd";
    case 1:
      return "";
  }
  return null;
}


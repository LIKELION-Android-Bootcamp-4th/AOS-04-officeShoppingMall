import 'package:office_shopping_mall/core/data/models/dto/product.dart';

class SearchProductResponse {
  final bool success;
  final String messgae;
  final List<Product> items;

  SearchProductResponse({
    required this.success,
    required this.messgae,
    required this.items,
  });

  factory SearchProductResponse.fromJson(Map<String, dynamic> json){
    return SearchProductResponse(
        success: json['success'] as bool? ?? false,
        messgae: json['message'] as String? ?? '',
        items: (json['data']?['items'] as List<dynamic> ?? []).map((e) =>
            Product.fromJson(e)).toList();
    );
  }

}

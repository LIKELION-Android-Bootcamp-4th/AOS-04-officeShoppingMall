import 'package:office_shopping_mall/core/data/models/dto/product.dart';

class OrderDTO {
  final Product product;
  int orderIndex;
  OrderDTO({required this.product, this.orderIndex = 1});

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      product: Product.fromJson(json['product']),
      orderIndex: json['orderIndex'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
    'product': product,
    'orderIndex': orderIndex,
  };
}
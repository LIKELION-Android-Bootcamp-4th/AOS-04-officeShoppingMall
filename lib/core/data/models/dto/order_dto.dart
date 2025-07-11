import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';

class OrderDTO {
  final ProductDTO product;
  int orderIndex;
  OrderDTO({required this.product, this.orderIndex = 1});

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      product: ProductDTO.fromJson(json['product']),
      orderIndex: json['orderIndex'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
    'product': product,
    'orderIndex': orderIndex,
  };
}
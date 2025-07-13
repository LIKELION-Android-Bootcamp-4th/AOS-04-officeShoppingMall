import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';

class OrderDTO {
  final ProductDTO product;
  final String orderId;
  int orderIndex;
  OrderDTO({required this.product, required this.orderId, this.orderIndex = 1});

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      product: ProductDTO.fromJson(json['product']),
      orderId: json['orderId'] ?? '',
      orderIndex: json['orderIndex'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
    'product': product,
    'orderId': orderId,
    'orderIndex': orderIndex,
  };
}
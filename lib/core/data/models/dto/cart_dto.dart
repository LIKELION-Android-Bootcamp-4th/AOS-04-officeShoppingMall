import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';

class CartDTO {
  final ProductDTO product;

  CartDTO({required this.product});

  factory CartDTO.fromJson(Map<String, dynamic> json) {
    return CartDTO(
      product: ProductDTO.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() => {
    'product' : product,
  };
}

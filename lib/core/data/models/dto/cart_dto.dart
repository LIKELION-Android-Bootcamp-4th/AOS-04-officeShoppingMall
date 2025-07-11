import 'package:office_shopping_mall/core/data/models/dto/product.dart';

class CartDTO {
  final Product product;

  CartDTO({required this.product});

  factory CartDTO.fromJson(Map<String, dynamic> json) {
    return CartDTO(
      product: Product.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() => {
    'product' : product,
  };
}

import 'package:office_shopping_mall/core/data/models/dto/product.dart';

class CartDTO {
  final Product product;
  final int cartIndex;

  CartDTO({required this.product, this.cartIndex = 0});

  factory CartDTO.fromJson(Map<String, dynamic> json) {
    return CartDTO(
      product: Product.fromJson(json['product']),
      cartIndex: json['cartIndex'] ?? 0,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'product' : product,
    'cartIndex' : cartIndex,
  };
}

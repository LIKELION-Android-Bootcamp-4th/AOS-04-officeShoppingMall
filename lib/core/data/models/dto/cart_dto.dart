import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';

class CartDTO {
  final ProductDTO product;
  final String cartId;
  final int quantity;

  CartDTO({required this.product, required this.cartId, required this.quantity});

  factory CartDTO.fromJson(Map<String, dynamic> json) {
    return CartDTO(
      product: ProductDTO.fromJson(json['product']),
      cartId: json['cartId'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'product': product,
    'cartId': cartId,
    'quantity': quantity,
  };
}

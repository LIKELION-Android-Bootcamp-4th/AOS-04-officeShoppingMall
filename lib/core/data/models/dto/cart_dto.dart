import 'package:office_shopping_mall/core/data/models/dto/product.dart';

class CartDTO {
  final Product product;
  final String cartId;
  final int quantity;

  CartDTO({required this.product, required this.cartId, required this.quantity});

  factory CartDTO.fromJson(Map<String, dynamic> json) {
    return CartDTO(
      product: Product.fromJson(json['product']),
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

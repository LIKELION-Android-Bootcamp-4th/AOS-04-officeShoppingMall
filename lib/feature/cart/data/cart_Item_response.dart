import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';

class CartAddResponse {
  final CartData data;

  CartAddResponse({required this.data});

  factory CartAddResponse.fromJson(Map<String, dynamic> json) {
    return CartAddResponse(data: CartData.fromJson(json['data'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() => {'data': data.toJson()};
}

class CartData {
  final String id;
  final String userId;
  final String companyId;
  final CartItemResponse item;
  final DateTime createdAt;

  CartData({
    required this.id,
    required this.userId,
    required this.companyId,
    required this.item,
    required this.createdAt,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      companyId: json['companyId'] ?? '',
      item: CartItemResponse.fromJson(json['item'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'companyId': companyId,
    'item': item.toJson(),
    'createdAt': createdAt.toIso8601String(),
  };
}

class CartItemResponse {
  final String id;
  final ProductDTO product;
  final int quantity;
  final int unitPrice;
  final int totalPrice;
  final Map<String, String> options;
  final DateTime addedAt;
  final DateTime createdAt;

  CartItemResponse({
    required this.id,
    required this.product,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    this.options = const {},
    required this.addedAt,
    required this.createdAt,
  });

  factory CartItemResponse.fromJson(Map<String, dynamic> json) {
    final productJson = json['productId'] as Map<String, dynamic>? ?? {};

    final opts =
        (json['options'] as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v.toString())) ?? {};

    return CartItemResponse(
      id: json['id'] as String? ?? '',
      product: ProductDTO.fromJson(productJson),
      quantity: json['quantity'] ?? 0,
      unitPrice: json['unitPrice'] ?? 0,
      totalPrice: json['totalPrice'] ?? 0,
      options: opts,
      addedAt: DateTime.parse(json['addedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'productId': product.toJson(),
    'quantity': quantity,
    'unitPrice': unitPrice,
    'totalPrice': totalPrice,
    'options': options,
    'addedAt': addedAt.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
  };

  CartItemResponse copyWith({
    String? id,
    ProductDTO? product,
    int? quantity,
    int? unitPrice,
    int? totalPrice,
    Map<String, String>? options,
    DateTime? addedAt,
    DateTime? createdAt,
  }) {
    return CartItemResponse(
      id:         id         ?? this.id,
      product:    product    ?? this.product,
      quantity:   quantity   ?? this.quantity,
      unitPrice:  unitPrice  ?? this.unitPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      options:    options    ?? this.options,
      addedAt:    addedAt    ?? this.addedAt,
      createdAt:  createdAt  ?? this.createdAt,
    );
  }
}
class CartItemRequest {
  final String productId;
  final int quantity;
  final int unitPrice;
  final Map<String, String> options;
  final Discount? discount;

  CartItemRequest({
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    this.options = const {},
    this.discount,
  });

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'quantity': quantity,
    'unitPrice': unitPrice,
    if (options.isNotEmpty) 'options': options,
    if (discount != null) 'discount': discount!.toJson(),
  };
}

class Discount {
  final String type;
  final num amount;

  Discount({required this.type, required this.amount});

  Map<String, dynamic> toJson() => {'type': type, 'amount': amount};
}


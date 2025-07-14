class CartOrderResponseDTO {
  final bool success;
  final String message;
  final OrderData data;

  CartOrderResponseDTO({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CartOrderResponseDTO.fromJson(Map<String, dynamic> json) {
    return CartOrderResponseDTO(
      success: json['success'],
      message: json['message'],
      data: OrderData.fromJson(json['data']['order']),
    );
  }
}

class OrderData {
  final String id;
  final String orderNumber;
  final String status;
  final int totalAmount;
  final List<OrderItem> items;
  final ShippingInfoSimple shippingInfo;
  final DateTime createdAt;

  OrderData({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.totalAmount,
    required this.items,
    required this.shippingInfo,
    required this.createdAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      id: json['id'],
      orderNumber: json['orderNumber'],
      status: json['status'],
      totalAmount: json['totalAmount'],
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      shippingInfo: ShippingInfoSimple.fromJson(json['shippingInfo']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class OrderItem {
  final ProductInfo product;
  final int quantity;
  final Map<String, dynamic> options;
  final int subtotal;

  OrderItem({
    required this.product,
    required this.quantity,
    required this.options,
    required this.subtotal,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      product: ProductInfo.fromJson(json['product']),
      quantity: json['quantity'],
      options: json['options'] ?? {},
      subtotal: json['subtotal'],
    );
  }
}

class ProductInfo {
  final String id;
  final String name;
  final int price;

  ProductInfo({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}

class ShippingInfoSimple {
  final String recipient;
  final String address;
  final String phone;

  ShippingInfoSimple({
    required this.recipient,
    required this.address,
    required this.phone,
  });

  factory ShippingInfoSimple.fromJson(Map<String, dynamic> json) {
    return ShippingInfoSimple(
      recipient: json['recipient'],
      address: json['address'],
      phone: json['phone'],
    );
  }
}

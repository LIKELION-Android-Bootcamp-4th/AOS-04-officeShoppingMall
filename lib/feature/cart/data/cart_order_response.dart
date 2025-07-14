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
    print('CartOrderResponseDTO json: $json');
    final orders = json['data']['orders'] as List<dynamic>?;

    if (orders == null || orders.isEmpty) {
      throw Exception('orders 데이터가 없습니다.');
    }

    print('첫 번째 order: ${orders[0]}');  // 첫 주문 객체 확인

    return CartOrderResponseDTO(
      success: json['success'],
      message: json['message'],
      data: OrderData.fromJson(orders[0]),
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
  final String memo;
  final DateTime createdAt;

  OrderData({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.totalAmount,
    required this.items,
    required this.shippingInfo,
    required this.memo,
    required this.createdAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    print('OrderData json: $json');
    return OrderData(
      id: json['id']?.toString() ?? '',
      orderNumber: json['orderNumber']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
      totalAmount: json['totalAmount'] ?? 0,
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      shippingInfo: ShippingInfoSimple.fromJson(json['shippingInfo'] ?? {}),
      memo: json['memo']?.toString() ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(), // 혹은 기본값 지정
    );
  }
}

class OrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final int unitPrice;
  final int totalPrice;
  final String? productImage;
  final String stockType;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    this.productImage,
    required this.stockType,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId']?.toString() ?? '',
      productName: json['productName']?.toString() ?? '',
      quantity: json['quantity'] ?? 0,
      unitPrice: json['unitPrice'] ?? 0,
      totalPrice: json['totalPrice'] ?? 0,
      productImage: json['productImage']?.toString(),
      stockType: json['stockType']?.toString() ?? '',
    );
  }
}

class ProductInfo {
  final String id;
  final String name;
  final int price;

  ProductInfo({required this.id, required this.name, required this.price});

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    print('ProductInfo json: $json');
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
  final String? zipCode;
  final String? deliveryOption;

  ShippingInfoSimple({
    required this.recipient,
    required this.address,
    required this.phone,
    this.zipCode,
    this.deliveryOption,
  });


  factory ShippingInfoSimple.fromJson(Map<String, dynamic> json) {
    return ShippingInfoSimple(
      recipient: json['recipient']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      zipCode: json.containsKey('zipCode') && json['zipCode'] != null
          ? json['zipCode'].toString()
          : '',
      deliveryOption: json.containsKey('deliveryOption') && json['deliveryOption'] != null
          ? json['deliveryOption'].toString()
          : '',
    );
  }
}

class CartOrderRequestDTO {
  final ShippingInfo shippingInfo;
  final String? memo;
  final List<String> cartIds;

  CartOrderRequestDTO({
    required this.shippingInfo,
    this.memo,
    required this.cartIds,
  });

  Map<String, dynamic> toJson() {
    return {
      'shippingInfo': shippingInfo.toJson(),
      'memo': memo,
      'cartIds': cartIds,
    };
  }
}

class ShippingInfo {
  final String recipient;
  final String address;
  final String phone;
  final String? zipCode;

  ShippingInfo({
    required this.recipient,
    required this.address,
    required this.phone,
    this.zipCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'recipient': recipient,
      'address': address,
      'phone': phone,
      'zipCode': zipCode,
    };
  }
}

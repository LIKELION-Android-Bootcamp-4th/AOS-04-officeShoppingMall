class OrderInfo {
  final String recipient;
  final String address;
  final String phone;
  final String paymentMethod;
  final int quantity;
  final int unitPrice;

  OrderInfo({
    required this.recipient,
    required this.address,
    required this.phone,
    required this.paymentMethod,
    required this.quantity,
    required this.unitPrice,
  });
}

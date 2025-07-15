class OrderInfo {
  final String paymentMethod;
  final String address;
  final int quantity;
  final int unitPrice;

  OrderInfo({
    required this.paymentMethod,
    required this.address,
    required this.quantity,
    required this.unitPrice,
  });
}
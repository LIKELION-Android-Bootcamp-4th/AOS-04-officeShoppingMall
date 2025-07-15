class OrderProductDTO{
  final String productName;
  final int quantity;
  final int unitPrice;
  final int totalPrice;
  final String thumbnailImageUrl;
  final String productId;
  OrderProductDTO({required this.productName, required this.quantity, required this.unitPrice,
  required this.totalPrice, required this.thumbnailImageUrl, required this.productId});

  factory OrderProductDTO.fromJson(Map<String, dynamic> json) {
    return OrderProductDTO(
      productName: json['productName'],
      quantity: json['quantity'],
      unitPrice: json['unitPrice'],
      totalPrice: json['totalPrice'],
      thumbnailImageUrl: json['thumbnailImageUrl'],
      productId: json['id']
    );
  }
  Map<String, dynamic> toJson() =>{
    "productName": this.productName,
    "quantity": this.quantity,
    "unitPrice": this.unitPrice,
    "totalPrice": this.totalPrice,
    "thumbnailImageUrl": this.thumbnailImageUrl,
    "product": this.productId
  };
}
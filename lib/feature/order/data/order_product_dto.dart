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
  // "productName": "vhpro 루테인",
  // "quantity": 1,
  // "unitPrice": 35000,
  // "totalPrice": 35000,
  // "productImage": null,
  // "stockType": "fixed",
  // "review": null,
  // "id": "6874c6ad82c6a7803200f5f9",
  // "images": "",
  // "discount": "",
  // "thumbnailImageUrl": "http://git.hansul.kr:3004/uploads/6866fd325b230f5dc709bdf7/1752483501061-thumbnailImage-3c8e870a.jpg",
  // "contentImage": null,
  // "contentImageUrl": null
}
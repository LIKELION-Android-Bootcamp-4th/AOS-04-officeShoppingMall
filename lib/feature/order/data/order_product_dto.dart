import '../../../core/data/models/dto/review_dto.dart';

class OrderProductDTO{
  final String productName;
  final int quantity;
  final int unitPrice;
  final int totalPrice;
  final String thumbnailImageUrl;
  final String productId;
  final ReviewDTO? review;
  OrderProductDTO({required this.productName, required this.quantity, required this.unitPrice,
  required this.totalPrice, required this.thumbnailImageUrl, required this.productId, this.review});

  factory OrderProductDTO.fromJson(Map<String, dynamic> json) {
    return OrderProductDTO(
      productName: json['productName'] ?? '',
      quantity: json['quantity'] ?? 0,
      unitPrice: json['unitPrice'] ?? 0,
      totalPrice: json['totalPrice'] ?? 0,
      thumbnailImageUrl: json['thumbnailImageUrl'] ?? '',
      productId: json['id'] ?? '',
      review: json['review'] != null ? ReviewDTO.fromJson(json['review']) : null,
    );
  }
  Map<String, dynamic> toJson() =>{
    "productName": this.productName,
    "quantity": this.quantity,
    "unitPrice": this.unitPrice,
    "totalPrice": this.totalPrice,
    "thumbnailImageUrl": this.thumbnailImageUrl,
    "product": this.productId,
    'review': review?.toJson(),
  };
}
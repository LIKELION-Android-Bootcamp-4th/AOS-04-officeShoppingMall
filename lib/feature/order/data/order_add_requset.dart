import 'package:office_shopping_mall/core/data/models/dto/shipping_info_dto.dart';
import 'package:office_shopping_mall/feature/order/data/order_product_dto.dart';

class OrderAddRequest {
  final List<OrderProductDTO> items;
  final ShippingInfoDTO shippingInfo;
  final String payment;
  final String memo;
  OrderAddRequest({required this.items, required this.shippingInfo, required this.payment, required this.memo});

  Map<String, dynamic> toJson() => {
    "items": items.map((e) => e.toJson()).toList(),
    "shippingInfo": shippingInfo.toJson(),
    "payment": this.payment,
    "memo": this.memo
  };
}
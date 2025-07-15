import 'package:office_shopping_mall/core/data/models/dto/shipping_info_dto.dart';
import 'package:office_shopping_mall/feature/order/data/order_product_dto.dart';
import 'package:office_shopping_mall/feature/payment/domain/order_info.dart';

class OrderDTO {
  final String orderId;
  final int subtotalAmount;
  final int shippingCost;
  final String status;
  final String memo;
  final String createdAt;
  final String updatedAt;
  final String orderNumber;
  final List<OrderProductDTO> items;
  final ShippingInfoDTO? shippingInfo;

  OrderDTO ({ required this.orderId, required this.subtotalAmount, required this.shippingCost, required this.status,
  required this.memo, required this.createdAt, required this.updatedAt, required this.orderNumber,
  required this.items, required this.shippingInfo});

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
        orderId: json['id'],
        subtotalAmount: json['subtotalAmount'],
        shippingCost: json['shippingCost'],
        status: json['status'],
        memo: json['memo'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        orderNumber: json['orderNumber'],
        items: (json['items'] as List).map((item) => OrderProductDTO.fromJson(item)).toList(),
        shippingInfo: json['shippingInfo'] == null ? null : ShippingInfoDTO.fromJson(json['shippingInfo']),
    );
  }
}
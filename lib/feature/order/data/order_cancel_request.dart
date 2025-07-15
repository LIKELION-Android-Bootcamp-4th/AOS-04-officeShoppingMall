class OrderCancelRequest {
  final String reason;
  final String detailReason;
  OrderCancelRequest({required this.detailReason, required this.reason});

  Map<String, dynamic> toJson() => {
    "reason": this.reason,
    "detailReason": this.detailReason
  };
}
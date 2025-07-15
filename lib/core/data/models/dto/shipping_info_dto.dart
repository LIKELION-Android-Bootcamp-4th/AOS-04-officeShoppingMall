class ShippingInfoDTO {
  final String recipient;
  final String address;
  final String phone;

  ShippingInfoDTO({
    required this.recipient,
    required this.address,
    required this.phone,
  });

  factory ShippingInfoDTO.fromJson(Map<String, dynamic> json) {
    return ShippingInfoDTO(
      recipient: json['recipient'],
      address: json['address'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
    "recipient": this.recipient,
    "address": this.address,
    "phone": this.phone,
  };
}

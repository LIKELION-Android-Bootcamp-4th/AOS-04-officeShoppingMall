class ShippingInfoDTO {
  final String recipient;
  final String address;
  final String phone;
  final String zipCode;
  final String deliveryOption;
  ShippingInfoDTO({required this.recipient, required this.address, required this.phone,
  required this.zipCode, required this.deliveryOption});

  factory ShippingInfoDTO.fromJson(Map<String, dynamic> json) {
    return ShippingInfoDTO(
        recipient: json['recipient'],
        address: json['address'],
        phone: json['phone'],
        zipCode: json['zipCode'],
        deliveryOption: json['deliveryOption'],
    );
  }

  Map<String, dynamic> toJson() => {
    "recipient": this.recipient,
    "address": this.address,
    "phone": this.phone,
    "zipCode": this.zipCode,
    "deliveryOption": this.deliveryOption
  };
}
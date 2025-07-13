enum UserRole { buyer, seller, admin }

class Image {
  final String? url;

  Image({required this.url});

  factory Image.fromJson(Map<String, dynamic> json) => Image(url: json['url'] ?? '');
}

class Profile {
  final String? name;
  final String? profileImage;

  Profile({required this.name, required this.profileImage});

  factory Profile.fromJson(Map<String, dynamic> json) {
    final dynamic imageJson = json['profileImage'];

    Image? parsedImage;

    if (imageJson != null) {
      if (imageJson is String) {
        parsedImage = Image(url: imageJson);
      } else if (imageJson is Map<String, dynamic>) {
        parsedImage = Image.fromJson(imageJson);
      } else {
        parsedImage = null;
      }
    }

    return Profile(
      name: json['name'] ?? '',
      profileImage: parsedImage?.url,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'profileImage': profileImage,
  };
}

class Address {
  final String zipCode;
  final String address1;
  final String address2;

  Address({required this.zipCode, required this.address1, required this.address2});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      zipCode: json['zipCode'] ?? '',
      address1: json['address1'] ?? '',
      address2: json['address2'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'zipCode': zipCode, 'address1': address1, 'address2': address2};
  }
}

class UserDTO {
  final String id;
  final String email;
  final String nickName;
  final bool isAdmin;
  final Profile profile;
  final String? phone;
  final Address? address;

  UserDTO({
    required this.id,
    required this.email,
    required this.nickName,
    required this.isAdmin,
    required this.profile,
    required this.phone,
    required this.address,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      nickName: json['nickName'] ?? '',
      isAdmin: json['isAdmin'] ?? false,
      profile: Profile.fromJson(json['profile'] ?? {}),
      phone: json['phone'] ?? '',
      address: Address.fromJson(json['address'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'nickName': nickName,
    'isAdmin': isAdmin,
    'profile': profile.toJson(),
    'phone': phone,
    'address': address?.toJson(),
  };
}

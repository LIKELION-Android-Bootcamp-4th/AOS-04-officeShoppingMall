import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final bool success;
  final String message;
  @JsonKey(name: 'data')
  final SignupResult result;

  SignupResponse({
    required this.success,
    required this.message,
    required this.result,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}

@JsonSerializable()
class SignupResult {
  final String accessToken;
  final String refreshToken;
  final SignupUserDTO user;

  SignupResult({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory SignupResult.fromJson(Map<String, dynamic> json) =>
      _$SignupResultFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResultToJson(this);
}

@JsonSerializable()
class SignupUserDTO {
  final String id;
  final String userId;
  final String email;
  final String nickName;
  final List<String> platformRoles;
  final bool isEmailVerified;
  final bool isActive;
  final bool needEmailVerification;
  final bool emailVerificationEnabled;
  final bool verificationCodeSent;

  SignupUserDTO({
    required this.id,
    required this.userId,
    required this.email,
    required this.nickName,
    required this.platformRoles,
    required this.isEmailVerified,
    required this.isActive,
    required this.needEmailVerification,
    required this.emailVerificationEnabled,
    required this.verificationCodeSent,
  });

  factory SignupUserDTO.fromJson(Map<String, dynamic> json) =>
      _$SignupUserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SignupUserDTOToJson(this);
}
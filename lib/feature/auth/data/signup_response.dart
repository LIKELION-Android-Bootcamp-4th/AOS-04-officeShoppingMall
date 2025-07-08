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
  final String userId;
  final String email;
  final String nickName;

  SignupResult({
    required this.userId,
    required this.email,
    required this.nickName,
  });

  factory SignupResult.fromJson(Map<String, dynamic> json) =>
      _$SignupResultFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResultToJson(this);
}

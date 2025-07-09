import 'package:json_annotation/json_annotation.dart';
import 'package:office_shopping_mall/feature/search/data/popular/popular_data_dto.dart';

part 'popular_response.g.dart';

@JsonSerializable()
class PopularResponse {
  final bool success;
  final String message;
  final DateTime timestamp;

  final PopularDataDto? data;

  PopularResponse({
    required this.success,
    required this.message,
    required this.timestamp,
    this.data,
  });

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularResponseToJson(this);
}

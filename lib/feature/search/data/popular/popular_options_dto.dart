import 'package:json_annotation/json_annotation.dart';

part 'popular_options_dto.g.dart';

// 성공했을 때, api 호출 시 사용했던 파라미터들이 담겨있음
@JsonSerializable()
class PopularOptionsDto {
  final int limit;
  final int minCount;

  @JsonKey(name: 'timeRange', includeIfNull: false)
  final String? timeRange;

  PopularOptionsDto({
    required this.limit,
    this.timeRange,
    required this.minCount,
  });

  factory PopularOptionsDto.fromJson(Map<String, dynamic> json) {
    return PopularOptionsDto(
      limit: json['limit'] as int,
      minCount: json['minCount'] as int,
      timeRange: json['timeRange'] as String?,
    );
  }

  Map<String, dynamic> toJson() => _$PopularOptionsDtoToJson(this);
}
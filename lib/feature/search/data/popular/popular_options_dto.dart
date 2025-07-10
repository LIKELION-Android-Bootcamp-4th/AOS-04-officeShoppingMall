import 'package:json_annotation/json_annotation.dart';

part 'popular_options_dto.g.dart';

// 성공했을 때, api 호출 시 사용했던 파라미터들이 담겨있음
@JsonSerializable()
class PopularOptionsDto {
  final int limit;
  final String? timeRange;
  final int minCount;

  PopularOptionsDto({
    required this.limit,
    this.timeRange,
    required this.minCount,
  });

  factory PopularOptionsDto.fromJson(Map<String, dynamic> json) =>
      _$PopularOptionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PopularOptionsDtoToJson(this);
}
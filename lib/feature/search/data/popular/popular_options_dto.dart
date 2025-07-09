import 'package:json_annotation/json_annotation.dart';

part 'popular_options_dto.g.dart';

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
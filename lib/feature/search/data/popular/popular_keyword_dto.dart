import 'package:json_annotation/json_annotation.dart';

part 'popular_keyword_dto.g.dart';

@JsonSerializable()
class PopularKeywordDto{
  @JsonKey(name: '_id')
  final String id;
  final String keyword;
  final int count;
  final int rank;

  PopularKeywordDto({
    required this.id,
    required this.keyword,
    required this.count,
    required this.rank
});

  factory PopularKeywordDto.fromJson(Map<String, dynamic> json) =>
      _$PopularKeywordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PopularKeywordDtoToJson(this);

}
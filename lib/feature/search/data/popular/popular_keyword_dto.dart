import 'package:json_annotation/json_annotation.dart';

part 'popular_keyword_dto.g.dart';

//성공했을 때 받는 data 안의 elements중 하나. 각 키워드의 상세정보
@JsonSerializable()
class PopularKeywordDto{
  @JsonKey(name: 'id')
  final String id;
  final String keyword;
  final int count;
  final int rank;

  @JsonKey(name: 'lastSearchedAt')
  final String? lastSearchedAt;

  PopularKeywordDto({
    required this.id,
    required this.keyword,
    required this.count,
    required this.rank,
    this.lastSearchedAt,
});

  factory PopularKeywordDto.fromJson(Map<String, dynamic> json) =>
      _$PopularKeywordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PopularKeywordDtoToJson(this);

}
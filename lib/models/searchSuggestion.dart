import 'package:json_annotation/json_annotation.dart';

part 'searchSuggestion.g.dart';

@JsonSerializable()
class SearchSuggestion {
  String query;
  List<String> suggestions = [];

  SearchSuggestion(this.query, this.suggestions);

  factory SearchSuggestion.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSuggestionToJson(this);
}

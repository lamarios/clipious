import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history_item.g.dart';

@JsonSerializable()
class SearchHistoryItem {
  String search;

  int time;

  SearchHistoryItem(this.search, this.time);

  factory SearchHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHistoryItemToJson(this);
}

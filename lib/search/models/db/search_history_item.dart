import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'search_history_item.g.dart';

@obox.Entity()
@JsonSerializable()
class SearchHistoryItem {
  @obox.Id()
  int id = 0;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  String search;

  int time;

  SearchHistoryItem(this.search, this.time);

  factory SearchHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHistoryItemToJson(this);
}

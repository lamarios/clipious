// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHistoryItem _$SearchHistoryItemFromJson(Map<String, dynamic> json) =>
    SearchHistoryItem(
      json['search'] as String,
      json['time'] as int,
    );

Map<String, dynamic> _$SearchHistoryItemToJson(SearchHistoryItem instance) =>
    <String, dynamic>{
      'search': instance.search,
      'time': instance.time,
    };

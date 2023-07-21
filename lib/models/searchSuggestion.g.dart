// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchSuggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestion _$SearchSuggestionFromJson(Map<String, dynamic> json) =>
    SearchSuggestion(
      json['query'] as String,
      (json['suggestions'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SearchSuggestionToJson(SearchSuggestion instance) =>
    <String, dynamic>{
      'query': instance.query,
      'suggestions': instance.suggestions,
    };

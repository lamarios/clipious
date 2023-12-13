// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dearrow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeArrow _$DeArrowFromJson(Map<String, dynamic> json) => DeArrow(
      titles: (json['titles'] as List<dynamic>).map((e) => DeArrowTitle.fromJson(e as Map<String, dynamic>)).toList(),
      thumbnails: (json['thumbnails'] as List<dynamic>)
          .map((e) => DeArrowThumbnail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeArrowToJson(DeArrow instance) => <String, dynamic>{
      'titles': instance.titles,
      'thumbnails': instance.thumbnails,
    };

DeArrowTitle _$DeArrowTitleFromJson(Map<String, dynamic> json) => DeArrowTitle(
      title: json['title'] as String?,
      original: json['original'] as bool? ?? false,
      votes: json['votes'] as int? ?? 0,
      locked: json['locked'] as bool? ?? false,
      uuid: json['UUID'] as String?,
    );

Map<String, dynamic> _$DeArrowTitleToJson(DeArrowTitle instance) => <String, dynamic>{
      'title': instance.title,
      'original': instance.original,
      'votes': instance.votes,
      'locked': instance.locked,
      'UUID': instance.uuid,
    };

DeArrowThumbnail _$DeArrowThumbnailFromJson(Map<String, dynamic> json) => DeArrowThumbnail(
      timestamp: (json['timestamp'] as num?)?.toDouble(),
      original: json['original'] as bool? ?? false,
      votes: json['votes'] as int? ?? 0,
      locked: json['locked'] as bool? ?? false,
      uuid: json['UUID'] as String?,
    );

Map<String, dynamic> _$DeArrowThumbnailToJson(DeArrowThumbnail instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'original': instance.original,
      'votes': instance.votes,
      'locked': instance.locked,
      'UUID': instance.uuid,
    };

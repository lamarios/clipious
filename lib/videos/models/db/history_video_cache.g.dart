// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_video_cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryVideoCache _$HistoryVideoCacheFromJson(Map<String, dynamic> json) =>
    HistoryVideoCache(
      json['videoId'] as String,
      json['title'] as String,
      json['author'] as String?,
      json['thumbnail'] as String,
    )..created = DateTime.parse(json['created'] as String);

Map<String, dynamic> _$HistoryVideoCacheToJson(HistoryVideoCache instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'videoId': instance.videoId,
      'created': instance.created.toIso8601String(),
      'thumbnail': instance.thumbnail,
    };

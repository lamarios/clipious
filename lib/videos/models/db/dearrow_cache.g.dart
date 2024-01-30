// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dearrow_cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeArrowCache _$DeArrowCacheFromJson(Map<String, dynamic> json) => DeArrowCache(
      json['videoId'] as String,
    )
      ..title = json['title'] as String?
      ..url = json['url'] as String?;

Map<String, dynamic> _$DeArrowCacheToJson(DeArrowCache instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'title': instance.title,
      'url': instance.url,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideosWithContinuation _$VideosWithContinuationFromJson(
        Map<String, dynamic> json) =>
    VideosWithContinuation(
      (json['videos'] as List<dynamic>)
          .map((e) => VideoInList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['continuation'] as String?,
    );

Map<String, dynamic> _$VideosWithContinuationToJson(
        VideosWithContinuation instance) =>
    <String, dynamic>{
      'continuation': instance.continuation,
      'videos': instance.videos,
    };

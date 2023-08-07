// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendedVideo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedVideo _$RecommendedVideoFromJson(Map<String, dynamic> json) =>
    RecommendedVideo(
      json['videoId'] as String,
      json['title'] as String,
      (json['videoThumbnails'] as List<dynamic>)
          .map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['author'] as String?,
      json['lengthSeconds'] as int,
      json['viewCountText'] as String,
    )
      ..authorId = json['authorId'] as String?
      ..authorUrl = json['authorUrl'] as String?;

Map<String, dynamic> _$RecommendedVideoToJson(RecommendedVideo instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'title': instance.title,
      'lengthSeconds': instance.lengthSeconds,
      'author': instance.author,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'videoThumbnails': instance.videoThumbnails,
      'viewCountText': instance.viewCountText,
    };

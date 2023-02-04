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
          .map((e) => VideoThumbnail.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['author'] as String,
      json['lengthSeconds'] as int,
      json['viewCountText'] as String,
    );

Map<String, dynamic> _$RecommendedVideoToJson(RecommendedVideo instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'title': instance.title,
      'videoThumbnails': instance.videoThumbnails,
      'author': instance.author,
      'lengthSeconds': instance.lengthSeconds,
      'viewCountText': instance.viewCountText,
    };

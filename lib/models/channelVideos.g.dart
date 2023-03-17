// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channelVideos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideosWithContinuation _$ChannelVideosFromJson(Map<String, dynamic> json) =>
    VideosWithContinuation(
      (json['videos'] as List<dynamic>)
          .map((e) => VideoInList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['continuation'] as String?,
    );

Map<String, dynamic> _$ChannelVideosToJson(VideosWithContinuation instance) =>
    <String, dynamic>{
      'videos': instance.videos,
      'continuation': instance.continuation,
    };

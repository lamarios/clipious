// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channelVideos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelVideos _$ChannelVideosFromJson(Map<String, dynamic> json) =>
    ChannelVideos(
      (json['videos'] as List<dynamic>)
          .map((e) => VideoInList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['continuation'] as String?,
    );

Map<String, dynamic> _$ChannelVideosToJson(ChannelVideos instance) =>
    <String, dynamic>{
      'videos': instance.videos,
      'continuation': instance.continuation,
    };

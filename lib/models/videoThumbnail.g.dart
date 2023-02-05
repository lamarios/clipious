// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoThumbnail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoThumbnail _$VideoThumbnailFromJson(Map<String, dynamic> json) =>
    VideoThumbnail(
      json['quality'] as String,
      json['url'] as String,
      json['width'] as int,
      json['height'] as int,
    );

Map<String, dynamic> _$VideoThumbnailToJson(VideoThumbnail instance) =>
    <String, dynamic>{
      'quality': instance.quality,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

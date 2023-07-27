// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formatStream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormatStream _$FormatStreamFromJson(Map<String, dynamic> json) => FormatStream(
      json['url'] as String,
      json['itag'] as String,
      json['type'] as String,
      json['quality'] as String,
      json['container'] as String,
      json['encoding'] as String,
      json['qualityLabel'] as String,
      json['resolution'] as String,
      json['size'] as String,
    );

Map<String, dynamic> _$FormatStreamToJson(FormatStream instance) =>
    <String, dynamic>{
      'url': instance.url,
      'itag': instance.itag,
      'type': instance.type,
      'quality': instance.quality,
      'container': instance.container,
      'encoding': instance.encoding,
      'qualityLabel': instance.qualityLabel,
      'resolution': instance.resolution,
      'size': instance.size,
    };

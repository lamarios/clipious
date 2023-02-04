// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adaptiveFormat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdaptiveFormat _$AdaptiveFormatFromJson(Map<String, dynamic> json) =>
    AdaptiveFormat(
      json['index'] as String,
      json['bitrate'] as String,
      json['init'] as String,
      json['url'] as String,
      json['itag'] as String,
      json['type'] as String,
      json['clen'] as String,
      json['lmt'] as String,
      json['projectionType'] as String,
      json['container'] as String?,
      json['encoding'] as String?,
      json['qualityLabel'] as String?,
      json['resolution'] as String?,
    );

Map<String, dynamic> _$AdaptiveFormatToJson(AdaptiveFormat instance) =>
    <String, dynamic>{
      'index': instance.index,
      'bitrate': instance.bitrate,
      'init': instance.init,
      'url': instance.url,
      'itag': instance.itag,
      'type': instance.type,
      'clen': instance.clen,
      'lmt': instance.lmt,
      'projectionType': instance.projectionType,
      'container': instance.container,
      'encoding': instance.encoding,
      'qualityLabel': instance.qualityLabel,
      'resolution': instance.resolution,
    };

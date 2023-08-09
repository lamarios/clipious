// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imageObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageObject _$ImageObjectFromJson(Map<String, dynamic> json) => ImageObject(
      json['quality'] as String?,
      json['url'] as String,
      json['width'] as int,
      json['height'] as int,
    );

Map<String, dynamic> _$ImageObjectToJson(ImageObject instance) =>
    <String, dynamic>{
      'quality': instance.quality,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

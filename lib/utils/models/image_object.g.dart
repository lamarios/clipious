// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageObject _$ImageObjectFromJson(Map<String, dynamic> json) => ImageObject(
      json['quality'] as String?,
      json['url'] as String,
      (json['width'] as num).toInt(),
      (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$ImageObjectToJson(ImageObject instance) =>
    <String, dynamic>{
      'quality': instance.quality,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

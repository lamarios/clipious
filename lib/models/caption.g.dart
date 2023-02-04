// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Caption _$CaptionFromJson(Map<String, dynamic> json) => Caption(
      json['label'] as String,
      json['languageCode'] as String?,
      json['url'] as String,
    );

Map<String, dynamic> _$CaptionToJson(Caption instance) => <String, dynamic>{
      'label': instance.label,
      'languageCode': instance.languageCode,
      'url': instance.url,
    };

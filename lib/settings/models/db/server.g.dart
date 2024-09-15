// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerImpl _$$ServerImplFromJson(Map<String, dynamic> json) => _$ServerImpl(
      url: json['url'] as String,
      authToken: json['authToken'] as String?,
      sidCookie: json['sidCookie'] as String?,
      customHeaders: (json['customHeaders'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      inUse: json['inUse'] as bool? ?? false,
    );

Map<String, dynamic> _$$ServerImplToJson(_$ServerImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'authToken': instance.authToken,
      'sidCookie': instance.sidCookie,
      'customHeaders': instance.customHeaders,
      'inUse': instance.inUse,
    };

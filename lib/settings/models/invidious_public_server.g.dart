// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invidious_public_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvidiousPublicServer _$InvidiousPublicServerFromJson(
        Map<String, dynamic> json) =>
    InvidiousPublicServer(
      json['stats'] == null
          ? null
          : InvidiousServerStats.fromJson(
              json['stats'] as Map<String, dynamic>),
      json['api'] as bool?,
      json['uri'] as String,
      json['flag'] as String,
      json['region'] as String,
    );

Map<String, dynamic> _$InvidiousPublicServerToJson(
        InvidiousPublicServer instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'api': instance.api,
      'uri': instance.uri,
      'flag': instance.flag,
      'region': instance.region,
    };

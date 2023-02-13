// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invidiousPublicServer.dart';

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
    );

Map<String, dynamic> _$InvidiousPublicServerToJson(
        InvidiousPublicServer instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'api': instance.api,
      'uri': instance.uri,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invidiousPublicServer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvidiousPublicServer _$InvidiousPublicServerFromJson(
        Map<String, dynamic> json) =>
    InvidiousPublicServer(
      InvidiousServerStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvidiousPublicServerToJson(
        InvidiousPublicServer instance) =>
    <String, dynamic>{
      'stats': instance.stats,
    };

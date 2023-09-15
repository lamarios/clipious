// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invidious_server_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvidiousServerStats _$InvidiousServerStatsFromJson(Map<String, dynamic> json) => InvidiousServerStats(
      InvidiousServerSoftware.fromJson(json['software'] as Map<String, dynamic>),
      json['openRegistrations'] as bool?,
    );

Map<String, dynamic> _$InvidiousServerStatsToJson(InvidiousServerStats instance) => <String, dynamic>{
      'software': instance.software,
      'openRegistrations': instance.openRegistrations,
    };

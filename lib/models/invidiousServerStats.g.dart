// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invidiousServerStats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvidiousServerStats _$InvidiousServerStatsFromJson(
        Map<String, dynamic> json) =>
    InvidiousServerStats(
      InvidiousServerSoftware.fromJson(
          json['software'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvidiousServerStatsToJson(
        InvidiousServerStats instance) =>
    <String, dynamic>{
      'software': instance.software,
    };

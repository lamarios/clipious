// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsorSegment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SponsorSegment _$SponsorSegmentFromJson(Map<String, dynamic> json) =>
    SponsorSegment(
      json['actionType'] as String,
      (json['segment'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$SponsorSegmentToJson(SponsorSegment instance) =>
    <String, dynamic>{
      'actionType': instance.actionType,
      'segment': instance.segment,
    };

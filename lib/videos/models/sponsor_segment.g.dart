// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SponsorSegment _$SponsorSegmentFromJson(Map<String, dynamic> json) => SponsorSegment(
      json['actionType'] as String,
      (json['segment'] as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
      $enumDecode(_$SponsorSegmentTypeEnumMap, json['category']),
    );

Map<String, dynamic> _$SponsorSegmentToJson(SponsorSegment instance) => <String, dynamic>{
      'actionType': instance.actionType,
      'segment': instance.segment,
      'category': _$SponsorSegmentTypeEnumMap[instance.category]!,
    };

const _$SponsorSegmentTypeEnumMap = {
  SponsorSegmentType.sponsor: 'sponsor',
  SponsorSegmentType.selfpromo: 'selfpromo',
  SponsorSegmentType.interaction: 'interaction',
  SponsorSegmentType.intro: 'intro',
  SponsorSegmentType.outro: 'outro',
  SponsorSegmentType.preview: 'preview',
  SponsorSegmentType.musicOffTopic: 'music_offtopic',
  SponsorSegmentType.filler: 'filler',
};

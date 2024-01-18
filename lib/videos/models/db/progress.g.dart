// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Progress _$ProgressFromJson(Map<String, dynamic> json) => Progress(
      (json['progress'] as num).toDouble(),
      json['videoId'] as String,
    );

Map<String, dynamic> _$ProgressToJson(Progress instance) => <String, dynamic>{
      'progress': instance.progress,
      'videoId': instance.videoId,
    };

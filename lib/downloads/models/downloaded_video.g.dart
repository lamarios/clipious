// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloadedVideoImpl _$$DownloadedVideoImplFromJson(
        Map<String, dynamic> json) =>
    _$DownloadedVideoImpl(
      videoId: json['videoId'] as String,
      title: json['title'] as String,
      author: json['author'] as String?,
      authorUrl: json['authorUrl'] as String?,
      downloadComplete: json['downloadComplete'] as bool? ?? false,
      downloadFailed: json['downloadFailed'] as bool? ?? false,
      audioOnly: json['audioOnly'] as bool? ?? false,
      lengthSeconds: (json['lengthSeconds'] as num).toInt(),
      quality: json['quality'] as String,
    );

Map<String, dynamic> _$$DownloadedVideoImplToJson(
        _$DownloadedVideoImpl instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'title': instance.title,
      'author': instance.author,
      'authorUrl': instance.authorUrl,
      'downloadComplete': instance.downloadComplete,
      'downloadFailed': instance.downloadFailed,
      'audioOnly': instance.audioOnly,
      'lengthSeconds': instance.lengthSeconds,
      'quality': instance.quality,
    };

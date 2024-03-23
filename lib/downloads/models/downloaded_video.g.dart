// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadedVideo _$DownloadedVideoFromJson(Map<String, dynamic> json) =>
    DownloadedVideo(
      videoId: json['videoId'] as String,
      title: json['title'] as String,
      author: json['author'] as String?,
      authorUrl: json['authorUrl'] as String?,
      downloadComplete: json['downloadComplete'] as bool? ?? false,
      downloadFailed: json['downloadFailed'] as bool? ?? false,
      audioOnly: json['audioOnly'] as bool? ?? false,
      lengthSeconds: json['lengthSeconds'] as int? ?? 1,
      folder: json['folder'] as String?,
      quality: json['quality'] as String? ?? '720p',
    );

Map<String, dynamic> _$DownloadedVideoToJson(DownloadedVideo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'authorUrl': instance.authorUrl,
      'downloadComplete': instance.downloadComplete,
      'downloadFailed': instance.downloadFailed,
      'audioOnly': instance.audioOnly,
      'lengthSeconds': instance.lengthSeconds,
      'quality': instance.quality,
      'folder': instance.folder,
      'videoId': instance.videoId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaylistImpl _$$PlaylistImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistImpl(
      type: json['type'] as String? ?? youtubePlaylist,
      title: json['title'] as String,
      playlistId: json['playlistId'] as String,
      author: json['author'] as String,
      authordId: json['authordId'] as String?,
      authorUrl: json['authorUrl'] as String?,
      authorThumbnails: (json['authorThumbnails'] as List<dynamic>?)
              ?.map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String?,
      videoCount: (json['videoCount'] as num).toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
      isListed: json['isListed'] as bool?,
      updated: (json['updated'] as num?)?.toInt(),
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PlaylistImplToJson(_$PlaylistImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'playlistId': instance.playlistId,
      'author': instance.author,
      'authordId': instance.authordId,
      'authorUrl': instance.authorUrl,
      'authorThumbnails': instance.authorThumbnails,
      'description': instance.description,
      'videoCount': instance.videoCount,
      'viewCount': instance.viewCount,
      'isListed': instance.isListed,
      'updated': instance.updated,
      'videos': instance.videos,
    };

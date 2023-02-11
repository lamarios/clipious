// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      json['type'] as String,
      json['title'] as String,
      json['playlistId'] as String,
      json['author'] as String,
      json['authordId'] as String?,
      json['authorUrl'] as String?,
      json['description'] as String?,
      json['videoCount'] as int,
    )
      ..authorThumbnails = (json['authorThumbnails'] as List<dynamic>?)
          ?.map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
          .toList()
      ..viewCount = json['viewCount'] as int?
      ..isListed = json['isListed'] as bool?
      ..videos = (json['videos'] as List<dynamic>)
          .map((e) => VideoInList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
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
      'videos': instance.videos,
    };

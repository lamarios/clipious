// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistNotification _$PlaylistNotificationFromJson(
        Map<String, dynamic> json) =>
    PlaylistNotification(
      json['playlistId'] as String,
      json['lastVideoCount'] as int,
      json['timestamp'] as int,
      json['playlistName'] as String,
    );

Map<String, dynamic> _$PlaylistNotificationToJson(
        PlaylistNotification instance) =>
    <String, dynamic>{
      'playlistId': instance.playlistId,
      'lastVideoCount': instance.lastVideoCount,
      'timestamp': instance.timestamp,
      'playlistName': instance.playlistName,
    };

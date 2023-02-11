// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channelPlaylists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelPlaylists _$ChannelPlaylistsFromJson(Map<String, dynamic> json) =>
    ChannelPlaylists(
      (json['playlists'] as List<dynamic>)
          .map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..continuation = json['continuation'] as String?;

Map<String, dynamic> _$ChannelPlaylistsToJson(ChannelPlaylists instance) =>
    <String, dynamic>{
      'playlists': instance.playlists,
      'continuation': instance.continuation,
    };

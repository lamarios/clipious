// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_playlists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelPlaylists _$ChannelPlaylistsFromJson(Map<String, dynamic> json) =>
    ChannelPlaylists(
      (json['playlists'] as List<dynamic>)
          .map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['continuation'] as String?,
    );

Map<String, dynamic> _$ChannelPlaylistsToJson(ChannelPlaylists instance) =>
    <String, dynamic>{
      'continuation': instance.continuation,
      'playlists': instance.playlists,
    };

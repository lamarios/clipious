import 'package:invidious/models/playlist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'channelPlaylists.g.dart';

@JsonSerializable()
class ChannelPlaylists{
  List<Playlist> playlists;
  String? continuation;

  ChannelPlaylists(this.playlists);

  factory ChannelPlaylists.fromJson(Map<String, dynamic> json) => _$ChannelPlaylistsFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelPlaylistsToJson(this);
}
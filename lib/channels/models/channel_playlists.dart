import 'package:invidious/playlists/models/playlist.dart';
import 'package:invidious/utils/models/item_with_continuation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'channel_playlists.g.dart';

@JsonSerializable()
class ChannelPlaylists extends ItemtWithContinuation<Playlist> {
  List<Playlist> playlists;

  ChannelPlaylists(this.playlists, String? continuation) : super(continuation);

  factory ChannelPlaylists.fromJson(Map<String, dynamic> json) =>
      _$ChannelPlaylistsFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelPlaylistsToJson(this);

  @override
  List<Playlist> getItems() {
    return playlists;
  }
}

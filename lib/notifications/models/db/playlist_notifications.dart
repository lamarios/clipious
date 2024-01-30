import 'package:json_annotation/json_annotation.dart';

part 'playlist_notifications.g.dart';

@JsonSerializable()
class PlaylistNotification {
  final String playlistId;

  int lastVideoCount = 0;

  int timestamp;

  String playlistName;

  PlaylistNotification(
      this.playlistId, this.lastVideoCount, this.timestamp, this.playlistName);

  factory PlaylistNotification.fromJson(Map<String, dynamic> json) =>
      _$PlaylistNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistNotificationToJson(this);
}

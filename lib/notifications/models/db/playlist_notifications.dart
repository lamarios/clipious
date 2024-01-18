import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'playlist_notifications.g.dart';

@obox.Entity()
@JsonSerializable()
class PlaylistNotification {
  @obox.Id()
  @JsonKey(includeFromJson: false, includeToJson: false)
  int id = 0;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
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

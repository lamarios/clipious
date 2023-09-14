import 'package:objectbox/objectbox.dart';

@Entity()
class PlaylistNotification {
  @Id()
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String playlistId;

  int lastVideoCount = 0;

  int timestamp;

  String playlistName;

  PlaylistNotification(this.playlistId, this.lastVideoCount, this.timestamp, this.playlistName);
}
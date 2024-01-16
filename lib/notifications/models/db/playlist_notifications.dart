import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'playlist_notifications.g.dart';

@obox.Entity()
@collection
class PlaylistNotification {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  @Index(unique: true, replace: true)
  String playlistId;

  int lastVideoCount = 0;

  int timestamp;

  String playlistName;

  PlaylistNotification(
      this.playlistId, this.lastVideoCount, this.timestamp, this.playlistName);
}

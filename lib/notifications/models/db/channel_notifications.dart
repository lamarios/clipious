import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'channel_notifications.g.dart';

@collection
@obox.Entity()
class ChannelNotification {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
  @Index(unique: true, replace: true)
  String channelId;

  String lastSeenVideoId;

  int timestamp;

  String channelName;

  ChannelNotification(
    this.channelId,
    this.channelName,
    this.lastSeenVideoId,
    this.timestamp,
  );
}

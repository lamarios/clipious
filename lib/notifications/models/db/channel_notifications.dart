import 'package:objectbox/objectbox.dart';

@Entity()
class ChannelNotification {
  @Id()
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
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

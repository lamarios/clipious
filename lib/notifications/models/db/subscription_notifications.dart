import 'package:objectbox/objectbox.dart';

@Entity()
class SubscriptionNotification {
  @Id()
  int id = 0;

  String lastSeenVideoId;

  int timestamp;

  SubscriptionNotification(this.lastSeenVideoId, this.timestamp);
}

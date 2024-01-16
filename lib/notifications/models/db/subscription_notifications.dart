import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'subscription_notifications.g.dart';

@obox.Entity()
@collection
class SubscriptionNotification {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

  String lastSeenVideoId;

  int timestamp;

  SubscriptionNotification(this.lastSeenVideoId, this.timestamp);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'subscription_notifications.g.dart';

@obox.Entity()
@JsonSerializable()
class SubscriptionNotification {
  @obox.Id()
  @JsonKey(includeFromJson: false, includeToJson: false)
  int id = 0;

  String lastSeenVideoId;

  int timestamp;

  SubscriptionNotification(this.lastSeenVideoId, this.timestamp);

  factory SubscriptionNotification.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionNotificationToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'subscription_notifications.g.dart';

@JsonSerializable()
class SubscriptionNotification {
  String lastSeenVideoId;

  int timestamp;

  SubscriptionNotification(this.lastSeenVideoId, this.timestamp);

  factory SubscriptionNotification.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionNotificationToJson(this);
}

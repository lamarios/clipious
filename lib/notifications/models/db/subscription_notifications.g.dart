// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionNotification _$SubscriptionNotificationFromJson(
        Map<String, dynamic> json) =>
    SubscriptionNotification(
      json['lastSeenVideoId'] as String,
      (json['timestamp'] as num).toInt(),
    );

Map<String, dynamic> _$SubscriptionNotificationToJson(
        SubscriptionNotification instance) =>
    <String, dynamic>{
      'lastSeenVideoId': instance.lastSeenVideoId,
      'timestamp': instance.timestamp,
    };

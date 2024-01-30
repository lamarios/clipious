// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelNotification _$ChannelNotificationFromJson(Map<String, dynamic> json) =>
    ChannelNotification(
      json['channelId'] as String,
      json['channelName'] as String,
      json['lastSeenVideoId'] as String,
      json['timestamp'] as int,
    );

Map<String, dynamic> _$ChannelNotificationToJson(
        ChannelNotification instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'lastSeenVideoId': instance.lastSeenVideoId,
      'timestamp': instance.timestamp,
      'channelName': instance.channelName,
    };

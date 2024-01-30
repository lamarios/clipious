import 'package:json_annotation/json_annotation.dart';

part 'channel_notifications.g.dart';

@JsonSerializable()
class ChannelNotification {
  final String channelId;

  String lastSeenVideoId;

  int timestamp;

  String channelName;

  ChannelNotification(
    this.channelId,
    this.channelName,
    this.lastSeenVideoId,
    this.timestamp,
  );

  factory ChannelNotification.fromJson(Map<String, dynamic> json) =>
      _$ChannelNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelNotificationToJson(this);
}

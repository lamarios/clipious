import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'channel_notifications.g.dart';

@obox.Entity()
@JsonSerializable()
class ChannelNotification {
  @obox.Id()
  @JsonKey(includeFromJson: false, includeToJson: false)
  int id = 0;

  @obox.Unique(onConflict: obox.ConflictStrategy.replace)
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

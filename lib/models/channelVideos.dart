import 'package:invidious/models/videoInList.dart';
import 'package:json_annotation/json_annotation.dart';

part 'channelVideos.g.dart';


@JsonSerializable()
class ChannelVideos{
  List<VideoInList> videos;
  String? continuation;

  ChannelVideos(this.videos, this.continuation);


  factory ChannelVideos.fromJson(Map<String, dynamic> json) => _$ChannelVideosFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelVideosToJson(this);
}
import 'package:invidious/models/videoInList.dart';
import 'package:json_annotation/json_annotation.dart';

part 'channelVideos.g.dart';


@JsonSerializable()
class VideosWithContinuation{
  List<VideoInList> videos;
  String? continuation;

  VideosWithContinuation(this.videos, this.continuation);


  factory VideosWithContinuation.fromJson(Map<String, dynamic> json) => _$ChannelVideosFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelVideosToJson(this);
}
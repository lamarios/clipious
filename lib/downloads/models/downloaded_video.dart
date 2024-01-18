import 'dart:io';

import 'package:invidious/videos/models/base_video.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;
import 'package:path_provider/path_provider.dart';

part 'downloaded_video.g.dart';

@obox.Entity()
@JsonSerializable()
class DownloadedVideo extends IdedVideo {
  @obox.Id()
  @JsonKey(includeFromJson: false, includeToJson: false)
  int id = 0;

  String title;
  String? author;
  String? authorUrl;
  bool downloadComplete;
  bool downloadFailed;
  bool audioOnly;
  int lengthSeconds;
  String quality;

  @override
  set videoId(String videoId) => super.videoId = videoId;

  @override
  String get videoId => super.videoId;

  @obox.Transient()
  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get mediaPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$videoId.${audioOnly ? 'webm' : 'mp4'}";
  }

  @obox.Transient()
  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get thumbnailPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$videoId.jpg";
  }

  DownloadedVideo(
      {this.id = 0,
      required String videoId,
      required this.title,
      this.author,
      this.authorUrl,
      this.downloadComplete = false,
      this.downloadFailed = false,
      this.audioOnly = false,
      this.lengthSeconds = 1,
      this.quality = '720p'})
      : super(videoId);

  factory DownloadedVideo.fromJson(Map<String, dynamic> json) =>
      _$DownloadedVideoFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadedVideoToJson(this);
}

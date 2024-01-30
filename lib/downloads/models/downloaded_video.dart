import 'dart:io';

import 'package:invidious/videos/models/base_video.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'downloaded_video.g.dart';

const String _downloadFolder = 'downloads';

@JsonSerializable()
class DownloadedVideo extends IdedVideo {
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get mediaPath async {
    Directory dir = await _getDownloadFolder();
    return "${dir.path}/$videoId.${audioOnly ? 'webm' : 'mp4'}";
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get thumbnailPath async {
    Directory dir = await _getDownloadFolder();
    return "${dir.path}/$videoId.jpg";
  }

  Future<Directory> _getDownloadFolder() async {
    Directory dir = await getApplicationDocumentsDirectory();
    dir = Directory(p.join(dir.path, _downloadFolder));
    if (!(await dir.exists())) {
      await dir.create(recursive: true);
    }

    return dir;
  }

  DownloadedVideo(
      {required String videoId,
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

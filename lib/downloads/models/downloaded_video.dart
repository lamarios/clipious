import 'dart:io';

import 'package:invidious/videos/models/base_video.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

@Entity()
class DownloadedVideo extends IdedVideo {
  @Id()
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
  String get videoId => super.videoId;

  @override
  set videoId(String videoId) => super.videoId = videoId;

  @Transient()
  Future<String> get mediaPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$videoId.${audioOnly ? 'webm' : 'mp4'}";
  }

  @Transient()
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
}

import 'dart:io';

import 'package:invidious/videos/models/base_video.dart';
import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;
import 'package:path_provider/path_provider.dart';

part 'downloaded_video.g.dart';

@obox.Entity()
@collection
class DownloadedVideo extends IdedVideo {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

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

  @obox.Transient()
  @ignore
  Future<String> get mediaPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$videoId.${audioOnly ? 'webm' : 'mp4'}";
  }

  @obox.Transient()
  @ignore
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

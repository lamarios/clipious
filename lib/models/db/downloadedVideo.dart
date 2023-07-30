import 'dart:io';

import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

@Entity()
class DownloadedVideo {
  @Id()
  int id = 0;

  String videoId;

  String title;
  String? author;
  String? authorUrl;
  bool downloadComplete;
  bool downloadFailed;
  bool audioOnly;
  int videoLenthInSeconds;
  String quality;

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
      {this.id = 0, required this.videoId, required this.title, this.author, this.authorUrl, this.downloadComplete = false, this.downloadFailed = false, this.audioOnly = false, this.videoLenthInSeconds = 1, this.quality = '720p'});
}

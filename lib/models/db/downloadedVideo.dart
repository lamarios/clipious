import 'dart:io';

import 'package:dio/dio.dart';
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

  @Transient()
  Future<String> get videoPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$videoId.mp4";
  }

  @Transient()
  Future<String> get thumbnailPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$videoId.jpg";
  }

  DownloadedVideo({this.id = 0, required this.videoId, required this.title, this.author, this.authorUrl, this.downloadComplete = false});
}

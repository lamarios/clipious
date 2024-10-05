import 'dart:io';

import 'package:clipious/videos/models/ided_video.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'downloaded_video.freezed.dart';

part 'downloaded_video.g.dart';

const String _downloadFolder = 'downloads';

@freezed
class DownloadedVideo with _$DownloadedVideo implements IdedVideo {
  @Implements<IdedVideo>()
  const factory DownloadedVideo(
      {required String videoId,
      required String title,
      String? author,
      String? authorUrl,
      @Default(false) bool downloadComplete,
      @Default(false) bool downloadFailed,
      @Default(false) bool audioOnly,
      required int lengthSeconds,
      required String quality}) = _DownloadedVideo;

  const DownloadedVideo._();

  factory DownloadedVideo.fromJson(Map<String, Object?> json) =>
      _$DownloadedVideoFromJson(json);

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get downloadPath async {
    Directory dir = await _getDownloadFolder();

    return "${dir.path}/$videoId.${audioOnly ? 'webm' : 'webm'}";
  }

  /// Effective path for legacy reasons, old  versions videos would be mp4, now it's all webm
  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get effectivePath async {
    Directory dir = await _getDownloadFolder();

    if (audioOnly) {
      return "${dir.path}/$videoId.webm";
    } else {
      final path = "${dir.path}/$videoId.webm";
      if (!await File(path).exists()) {
        return "${dir.path}/$videoId.mp4";
      }

      return path;
    }
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
}

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:invidious/videos/models/base_video.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_storage/shared_storage.dart' as saf;

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
  String? folder;

  @override
  set videoId(String videoId) => super.videoId = videoId;

  @override
  String get videoId => super.videoId;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get mediaPath async {
    String dir = await _getDownloadFolder();
    return "$dir/$videoId.${audioOnly ? 'webm' : 'mp4'}";
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get mediaFileName => '$videoId.${audioOnly ? 'webm' : 'mp4'}';

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get thumbnailFileName => '$videoId.jpg';

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get mediaMimeType => audioOnly ? 'audio/webm' : 'video/mp4';

  /// where we download first, might be moved later if using custon destination
  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get tempMediaPath async {
    String dir = (await getTemporaryDownloadFolder()).path;
    return "$dir/$mediaFileName";
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get thumbnailPath async {
    String dir = await _getDownloadFolder();
    return "$dir/$thumbnailFileName";
  }

  /// where we download first, might be moved later if using custon destination
  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<String> get tempThumbnailPath async {
    String dir = (await getTemporaryDownloadFolder()).path;
    return "$dir/$videoId.jpg";
  }

  Future<Directory> getTemporaryDownloadFolder() async {
    Directory dir = await getApplicationDocumentsDirectory();
    dir = Directory(p.join(dir.path, _downloadFolder));
    if (!(await dir.exists())) {
      await dir.create(recursive: true);
    }

    return dir;
  }

  Future<String> _getDownloadFolder() async {
    if (folder != null) {
      return folder!;
    }

    return (await getTemporaryDownloadFolder()).path;
  }

  Future<File> mediaFileForPlayback() async {
    var tempMedia = await tempMediaPath;
    var media = await mediaPath;
    bool isCustomLocation = tempMedia != media;

    if (isCustomLocation) {
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/${mediaFileName}');

      final parent = await Uri.parse(media).toDocumentFile();
      final mediaDocumentFile = await parent?.child(mediaFileName);

      await mediaDocumentFile?.copy(tempFile.uri);

      // tempFile.writeAsBytes((await mediaBytes) ?? []);

      return tempFile;
    } else {
      return File(media);
    }
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<Uint8List?> get thumbBytes async {
    var tempThumb = await tempThumbnailPath;
    var thumb = await thumbnailPath;
    bool isCustomLocation = tempThumb != thumb;

    if (isCustomLocation) {
      // this always return the parent even if the uri is correct ?!
      final parent = await Uri.parse(thumb).toDocumentFile();
      final mediaDocumentFile = await parent?.child(thumbnailFileName);
      var content = await mediaDocumentFile?.getContent();

      print(thumb);
      return content;
    } else {
      return File(thumb).readAsBytes();
    }
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<Uint8List?> get mediaBytes async {
    var tempMedia = await tempMediaPath;
    var media = await mediaPath;
    bool isCustomLocation = tempMedia != media;

    if (isCustomLocation) {
      final parent = await Uri.parse(media).toDocumentFile();
      final mediaDocumentFile = await parent?.child(mediaFileName);

      return mediaDocumentFile?.getContent();
    } else {
      return File(media).readAsBytes();
    }
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<bool> get filesExists async {
    return await mediaExists && await thumbExists;
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<bool> get mediaExists async {
    try {
      var tempMedia = await tempMediaPath;
      var media = await mediaPath;
      bool isCustomLocation = tempMedia != media;

      if (!isCustomLocation) {
        final mediaFile = File(media);
        return await mediaFile.exists();
      } else {
        // this always return the parent even if the uri is correct ?!
        final parent = await Uri.parse(media).toDocumentFile();
        final mediaDocumentFile = await parent?.child(mediaFileName);
        return (await mediaDocumentFile?.exists() ?? false);
      }
    } catch (e) {
      return false;
    }
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  Future<bool> get thumbExists async {
    try {
      var tempThumb = await tempThumbnailPath;
      var thumb = await thumbnailPath;
      bool isCustomLocation = tempThumb != thumb;

      if (!isCustomLocation) {
        final thumbFile = File(thumb);
        return await thumbFile.exists();
      } else {
        // this always return the parent even if the uri is correct ?!
        final parent = await Uri.parse(thumb).toDocumentFile();
        final thumbDocumentFile = await parent?.child(thumbnailFileName);
        return (await thumbDocumentFile?.exists() ?? false);
      }
    } catch (e) {
      return false;
    }
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
      this.folder,
      this.quality = '720p'})
      : super(videoId);

  factory DownloadedVideo.fromJson(Map<String, dynamic> json) =>
      _$DownloadedVideoFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadedVideoToJson(this);
}

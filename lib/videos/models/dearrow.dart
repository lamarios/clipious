import 'package:clipious/globals.dart';
import 'package:clipious/videos/models/db/dearrow_cache.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../settings/models/db/settings.dart';

part 'dearrow.g.dart';

@JsonSerializable()
class DeArrow {
  final List<DeArrowTitle> titles;
  final List<DeArrowThumbnail> thumbnails;

  @JsonKey(includeFromJson: false, includeToJson: false)
  late final String videoId;

  String? get thumbnailUrl => thumbnails.isNotEmpty
      ? 'https://dearrow-thumb.ajay.app/api/v1/getThumbnail?videoID=:id&time=:time'
          .replaceAll(':id', videoId)
          .replaceAll(":time", thumbnails.first.timestamp.toString())
      : null;

  DeArrow({required this.titles, required this.thumbnails});

  factory DeArrow.fromJson(Map<String, dynamic> json) =>
      _$DeArrowFromJson(json);

  Map<String, dynamic> toJson() => _$DeArrowToJson(this);

  static Future<List<Video>> processVideos(List<Video>? videos) async {
    var process = db.getSettings(dearrowSettingName)?.value == "true";
    if (videos != null && process) {
      bool doThumbnails =
          db.getSettings(dearrowThumbnailsSettingName)?.value == "true";
      var futureTasks =
          videos.map((e) => _deArrowVideo(e, doThumbnails)).toList();

      return await Future.wait(futureTasks);
    } else {
      return videos ?? [];
    }
  }

  static Future<Video> _deArrowVideo(Video video, bool doThumbnails) async {
    var cache = db.getDeArrowCache(video.videoId);

    var vid = video.copyWith();

    if (cache != null) {
      if (cache.title != null) {
        vid = vid.copyWith(title: cache.title!);
      }

      // if we just need the title, we're done
      if (!doThumbnails) return vid;

      if (cache.url != null) {
        // bool isThumbnailAvailable = await service.testDeArrowThumbnail(cache.url);
        // if (isThumbnailAvailable) {
        vid = vid.copyWith(deArrowThumbnailUrl: cache.url);
        // if we've set both things from cache, we stop otherwise we go through normal process
        return vid;
        // }
      }
    }

    var deArrow = await service.getDeArrow(video.videoId);
    var titles = deArrow?.titles ?? [];
    if (titles.isNotEmpty) {
      vid = vid.copyWith(title: deArrow!.titles.first.title ?? video.title);
    }
    if (doThumbnails) {
      var thumbnail = deArrow?.thumbnailUrl;
      bool isThumbnailAvailable = await service.testDeArrowThumbnail(thumbnail);
      if (isThumbnailAvailable) {
        vid = vid.copyWith(deArrowThumbnailUrl: thumbnail);
      }
    }

    DeArrowCache newCache = DeArrowCache(video.videoId);
    newCache.title = deArrow?.titles.firstOrNull?.title;
    newCache.url = deArrow?.thumbnailUrl;
    if (newCache.title != null || newCache.url != null) {
      await db.upsertDeArrowCache(newCache);
    }

    return vid;
  }
}

@JsonSerializable()
class DeArrowTitle {
  final String? title;
  final bool original;
  final int votes;
  final bool locked;
  @JsonKey(name: 'UUID')
  final String? uuid;

  DeArrowTitle(
      {this.title,
      this.original = false,
      this.votes = 0,
      this.locked = false,
      this.uuid});

  factory DeArrowTitle.fromJson(Map<String, dynamic> json) =>
      _$DeArrowTitleFromJson(json);

  Map<String, dynamic> toJson() => _$DeArrowTitleToJson(this);
}

@JsonSerializable()
class DeArrowThumbnail {
  final double? timestamp;
  final bool original;
  final int votes;
  final bool locked;
  @JsonKey(name: 'UUID')
  final String? uuid;

  DeArrowThumbnail(
      {this.timestamp,
      this.original = false,
      this.votes = 0,
      this.locked = false,
      this.uuid});

  factory DeArrowThumbnail.fromJson(Map<String, dynamic> json) =>
      _$DeArrowThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$DeArrowThumbnailToJson(this);
}

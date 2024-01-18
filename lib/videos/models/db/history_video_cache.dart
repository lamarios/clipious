import 'package:invidious/videos/models/base_video.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart' as obox;

import '../../../globals.dart';
import '../../../utils/models/image_object.dart';

part 'history_video_cache.g.dart';

@obox.Entity()
@JsonSerializable()
class HistoryVideoCache {
  @obox.Id()
  @JsonKey(includeFromJson: false, includeToJson: false)
  int id = 0;

  String title;
  String? author;

  String videoId;
  DateTime created = DateTime.now();

  String thumbnail;

  HistoryVideoCache(this.videoId, this.title, this.author, this.thumbnail);

  factory HistoryVideoCache.fromJson(Map<String, dynamic> json) =>
      _$HistoryVideoCacheFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryVideoCacheToJson(this);

  BaseVideo toBaseVideo() {
    return BaseVideo(title, videoId, 0, author, null, null,
        [ImageObject("high", thumbnail, 1280, 720)]);
  }

  static Future<HistoryVideoCache> fromVideoIdToVideo(String e) async {
    var cachedVideo = db.getHistoryVideoByVideoId(e);
    if (cachedVideo == null) {
      var vid = await service.getVideo(e);
      cachedVideo = HistoryVideoCache(vid.videoId, vid.title, vid.author,
          ImageObject.getBestThumbnail(vid.videoThumbnails)?.url ?? '');
      await db.upsertHistoryVideo(cachedVideo);
    }
    return cachedVideo;
  }
}

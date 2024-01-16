import 'package:invidious/videos/models/base_video.dart';
import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart' as obox;

import '../../../globals.dart';
import '../../../utils/models/image_object.dart';

part 'history_video_cache.g.dart';

@obox.Entity()
@collection
class HistoryVideoCache {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

  String title;
  String? author;

  @Index()
  String videoId;
  DateTime created = DateTime.now();

  String thumbnail;

  HistoryVideoCache(this.videoId, this.title, this.author, this.thumbnail);

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
      db.upsertHistoryVideo(cachedVideo);
    }
    return cachedVideo;
  }
}

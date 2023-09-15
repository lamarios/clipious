import 'package:invidious/videos/models/base_video.dart';
import 'package:objectbox/objectbox.dart';

import '../../../globals.dart';
import '../../../utils/models/image_object.dart';

@Entity()
class HistoryVideoCache {
  @Id()
  int id = 0;

  String title;
  String? author;
  String videoId;
  DateTime created = DateTime.now();

  String thumbnail;

  HistoryVideoCache(this.videoId, this.title, this.author, this.thumbnail);

  BaseVideo toBaseVideo() {
    return BaseVideo(title, videoId, 0, author, null, null, [ImageObject("high", thumbnail, 1280, 720)]);
  }

  static Future<HistoryVideoCache> fromVideoIdToVideo(String e) async {
    var cachedVideo = db.getHistoryVideoByVideoId(e);
    if (cachedVideo == null) {
      var vid = await service.getVideo(e);
      cachedVideo = HistoryVideoCache(
          vid.videoId, vid.title, vid.author, ImageObject.getWorstThumbnail(vid.videoThumbnails)?.url ?? '');
      db.upsertHistoryVideo(cachedVideo);
    }
    return cachedVideo;
  }
}

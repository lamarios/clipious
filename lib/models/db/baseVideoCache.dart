import 'package:invidious/models/baseVideo.dart';
import 'package:objectbox/objectbox.dart';

import '../imageObject.dart';

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
}

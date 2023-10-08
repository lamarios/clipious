import 'package:invidious/settings/models/db/video_filter.dart';
import 'package:invidious/videos/models/dearrow.dart';

import '../videos/models/base_video.dart';

Future<List<BaseVideo>> postProcessVideos(List<BaseVideo>? toProcess) async {
  List<BaseVideo> videos = toProcess ?? [];
  videos = await VideoFilter.filterVideos(videos);
  videos = await DeArrow.processVideos(videos);
  return videos;
}

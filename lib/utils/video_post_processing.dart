import 'package:invidious/settings/models/db/video_filter.dart';
import 'package:invidious/videos/models/dearrow.dart';
import 'package:logging/logging.dart';

import '../videos/models/base_video.dart';

var log = Logger('Video post process');
const privateVideoString = "[Private video]";

Future<List<BaseVideo>> postProcessVideos(List<BaseVideo> toProcess) async {
  try {
    int start = DateTime.now().millisecondsSinceEpoch;
    List<BaseVideo> videos = toProcess
        .where((element) => element.title != privateVideoString)
        .toList();

    videos = await VideoFilter.filterVideos(videos);
    videos = await DeArrow.processVideos(videos);

    log.fine(
        "Filter + DeArrow took ${DateTime.now().millisecondsSinceEpoch - start}ms for ${toProcess.length} videos");
    return videos;
  } catch (err) {
    log.severe('Issue while running post process', err);
    return toProcess;
  }
}

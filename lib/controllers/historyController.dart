import 'package:get/get.dart';
import 'package:invidious/controllers/videoListController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/utils.dart';

import '../models/db/baseVideoCache.dart';

class HistoryController extends ItemListController<String> {
  static HistoryController? to() => safeGet();
  String? historyError;

  HistoryController({required super.itemList});

  removeFromHistory(String videoId) async {
    await service.deleteFromUserHistory(videoId);
    super.refreshItems();
  }

  clearHistory() async {
    await service.clearUserHistory();
    refreshItems();
  }
}

class HistoryItemController extends GetxController {
  final String videoId;
  bool loading = true;
  HistoryVideoCache? cachedVid;

  HistoryItemController({required this.videoId});

  @override
  void onReady() {
    super.onReady();
    getVideo();
  }

  getVideo() async {
    loading = true;
    update();
    cachedVid = db.getHistoryVideoByVideoId(videoId);
    if (cachedVid == null) {
      var vid = await service.getVideo(videoId);
      cachedVid = HistoryVideoCache(vid.videoId, vid.title, vid.author, ImageObject.getWorstThumbnail(vid.videoThumbnails)?.url ?? '');
      db.upsertHistoryVideo(cachedVid!);
    }

    loading = false;
    update();
  }
}

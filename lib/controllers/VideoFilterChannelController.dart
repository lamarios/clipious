import 'package:get/get.dart';
import 'package:invidious/controllers/videoFilterController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/channel.dart';

import '../models/db/videoFilter.dart';

const String allChannels = 'all';

class VideoFilterChannelController extends GetxController {
  final List<VideoFilter> filters;
  Channel? channel;
  bool loading = false;

  VideoFilterChannelController({required this.filters});

  @override
  onReady() {
    super.onReady();
    getChannel();
  }

  bool hasChannel() {
    return filters.isNotEmpty && filters[0].channelId != null && filters[0].channelId != allChannels;
  }

  Future<void> getChannel() async {
    if (filters.isNotEmpty && filters[0].channelId != null && filters[0].channelId != allChannels) {
      loading = true;
      update();
      channel = await service.getChannel(filters[0].channelId!);
      loading = false;
    }
    update();
  }

  void deleteFilter(VideoFilter filter) {
    db.deleteFilter(filter);
    update();
    VideoFilterController.to()?.refreshFilters();
  }
}

import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/channel.dart';
import 'package:logging/logging.dart';

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

  Future<void> getChannel() async {
    if (filters.isNotEmpty && filters[0].channelId != null && filters[0].channelId != allChannels) {
      channel = await service.getChannel(filters[0].channelId!);
    }
    update();
  }
}

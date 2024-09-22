import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:clipious/channels/views/components/videos.dart';

import '../../../globals.dart';
import '../../models/channel.dart';

@RoutePage()
class ChannelShortsTab extends StatelessWidget {
  final Channel? channel;

  const ChannelShortsTab({super.key, this.channel});

  @override
  Widget build(BuildContext context) {
    return channel == null
        ? const SizedBox.shrink()
        : ChannelVideosView(
            channel: channel!,
            getVideos: service.getChannelShorts,
          );
  }
}

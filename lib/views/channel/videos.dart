import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invidious/models/channelVideos.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/videoList.dart';

import '../../models/channel.dart';
import '../../models/paginatedList.dart';

class ChannelVideosView extends StatelessWidget {
  final Channel channel;
  final Future<VideosWithContinuation> Function(String channelId, String? continuation) getVideos;

  const ChannelVideosView({super.key, required this.channel, required this.getVideos});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: VideoList(
        key: const ValueKey('channel-videos'),
        paginatedVideoList: ContinuationList<VideoInList>((continuation) => getVideos(channel.authorId, continuation)),
        tags: 'channel-video-list-${(key as ValueKey<String>).value}'
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clipious/channels/models/channel_videos.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/videos/models/video_in_list.dart';
import 'package:clipious/videos/views/components/video_list.dart';

import '../../../utils/models/paginated_list.dart';
import '../../models/channel.dart';

class ChannelVideosView extends StatelessWidget {
  final Channel channel;
  final Future<VideosWithContinuation> Function(
      String channelId, String? continuation) getVideos;

  const ChannelVideosView(
      {super.key, required this.channel, required this.getVideos});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: innerHorizontalPadding),
      child: Container(
        color: colorScheme.surface,
        child: VideoList(
          paginatedVideoList: ContinuationList<VideoInList>(
              (continuation) => getVideos(channel.authorId, continuation)),
          // tags: 'channel-video-list-${(key as ValueKey<String>).value}'
        ),
      ),
    );
  }
}

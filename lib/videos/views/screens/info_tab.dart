import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../models/video.dart';
import '../components/info.dart';

@RoutePage()
class VideoInfoTab extends StatelessWidget {
  final Video? video;
  final int? dislikes;
  final bool titleAndChannelInfo;

  const VideoInfoTab(
      {super.key, this.video, this.dislikes, this.titleAndChannelInfo = true});

  @override
  Widget build(BuildContext context) {
    return video == null
        ? const SizedBox.shrink()
        : SingleChildScrollView(
            child: VideoInfo(
              video: video!,
              dislikes: dislikes,
              titleAndChannelInfo: titleAndChannelInfo,
            ),
          );
  }
}

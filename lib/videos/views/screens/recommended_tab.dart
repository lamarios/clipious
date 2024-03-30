import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:invidious/videos/views/components/recommended_videos.dart';

import '../../models/video.dart';

@RoutePage()
class RecommendedTab extends StatelessWidget {
  final Video? video;

  const RecommendedTab({super.key, this.video});

  @override
  Widget build(BuildContext context) {
    return video == null
        ? const SizedBox.shrink()
        : SingleChildScrollView(child: RecommendedVideos(video: video!));
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:invidious/comments/views/components/comments_container.dart';

import '../../models/video.dart';

@RoutePage()
class CommentsTab extends StatelessWidget {
  final Video? video;
  const CommentsTab({super.key, this.video});

  @override
  Widget build(BuildContext context) {
    return video == null
        ? const SizedBox.shrink()
        : SingleChildScrollView(child: CommentsContainer(video: video!));
  }
}

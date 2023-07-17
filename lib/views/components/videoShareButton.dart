import 'package:flutter/material.dart';

import '../../models/baseVideo.dart';
import '../../utils.dart';

class VideoShareButton extends StatelessWidget {
  final BaseVideo video;

  const VideoShareButton({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () =>
          showSharingSheet(context, video, showShareWithTimestamp: true),
      icon: const Icon(Icons.share),
    );
  }
}

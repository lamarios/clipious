import 'package:flutter/material.dart';

import '../../../utils.dart';
import '../../models/base_video.dart';

class VideoShareButton extends StatelessWidget {
  final BaseVideo video;
  final bool showTimestampOption;

  const VideoShareButton(
      {super.key, required this.video, this.showTimestampOption = false});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showSharingSheet(context, video,
          showTimestampOption: showTimestampOption),
      icon: const Icon(Icons.share),
    );
  }
}

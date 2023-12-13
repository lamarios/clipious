import 'package:flutter/material.dart';

import '../../../utils.dart';
import '../../models/base_video.dart';

class VideoShareButton extends StatelessWidget {
  final BaseVideo video;
  final bool showTimestampOption;

  const VideoShareButton(
      {Key? key, required this.video, this.showTimestampOption = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showSharingSheet(context, video,
          showTimestampOption: showTimestampOption),
      icon: const Icon(Icons.share),
    );
  }
}

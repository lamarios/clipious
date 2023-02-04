import 'package:flutter/cupertino.dart';
import 'package:invidious/models/video.dart';

import '../../models/video.dart';

class VideoInfo extends StatelessWidget {
  Video video;

  VideoInfo({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Text(video.description));
  }

}
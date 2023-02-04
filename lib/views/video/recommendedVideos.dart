import 'package:flutter/cupertino.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/videoList.dart';

import '../../models/video.dart';
import '../../models/videoInList.dart';

class RecommendedVideos extends StatelessWidget {
  Video video;

  RecommendedVideos({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return VideoList(title: 'Recommended', getVideos: ()async{

      return video.recommendedVideos.map((e) => VideoInList(e.title, e.videoId, e.lengthSeconds, 0, e.author, '', 'authorUrl', 0, e.videoThumbnails)).toList();
    });
  }

}
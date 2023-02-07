import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invidious/models/videoInList.dart';

import '../../utils.dart';
import '../video.dart';
import '../videoList.dart';

class VideoListItem extends StatelessWidget {
  final VideoInList video;

  const VideoListItem({super.key, required this.video});

  openVideo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoView(videoId: video.videoId)));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => openVideo(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(10), image: DecorationImage(image: NetworkImage(video.getBestThumbnail()?.url ?? ''), fit: BoxFit.cover)),
            ),
          ),
          Text(
            video.title,
            textAlign: TextAlign.left,
            style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.normal),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  video.author,
                  style: TextStyle(color: colorScheme.secondary),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text(video.publishedText)),
              Visibility(visible: video.viewCount > 0, child: Icon(Icons.visibility)),
              Visibility(
                  visible: video.viewCount > 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(compactCurrency.format(video.viewCount)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/components/videoThumbnail.dart';

import '../../models/imageObject.dart';
import '../../utils.dart';
import '../video.dart';

class VideoListItem extends StatelessWidget {
  final VideoInList video;

  const VideoListItem({super.key, required this.video});

  openVideo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoView(videoId: video.videoId)));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double progress = db.getVideoProgress(video.videoId);

    return GestureDetector(
      onTap: () => openVideo(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          VideoThumbnailView(
            videoId: video.videoId,
            thumbnailUrl: ImageObject.getBestThumbnail(video!.videoThumbnails)?.url ?? '',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: progress > 0.1 && progress < 0.90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                          child: Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 3,
                              color: colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: progress >= 0.90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                          child: Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(30)),
                              child: Icon(
                                Icons.check,
                                color: colorScheme.primary,
                                size: 15,
                              )),
                        ),
                      ),
                      Visibility(
                        visible: video.lengthSeconds > 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 25,
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.75), borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                prettyDuration(Duration(seconds: video.lengthSeconds)),
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            video.title,
            textAlign: TextAlign.left,
            style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.normal),
          ),
          Visibility(
            child: Row(
              children: [
                Text(
                  video.author ?? '',
                  style: TextStyle(color: colorScheme.secondary),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Visibility(visible: (video.viewCount ?? 0) > 0, child: Icon(Icons.visibility)),
              Visibility(
                  visible: (video.viewCount ?? 0) > 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(compactCurrency.format(video.viewCount)),
                  )),
              Expanded(
                  child: Text(
                video.publishedText ?? '',
                textAlign: TextAlign.end,
              )),
            ],
          )
        ],
      ),
    );
  }
}

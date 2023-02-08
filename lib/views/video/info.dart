import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/channel.dart';
import 'package:invidious/views/components/subscribeButton.dart';

import '../../models/imageObject.dart';
import '../../utils.dart';

class VideoInfo extends StatelessWidget {
  Video video;

  VideoInfo({super.key, required this.video});

  openChannel(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChannelView(channelId: video.authorId)));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          video.title ?? '',
          style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.normal, fontSize: 20),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Visibility(
                  visible: video.likeCount > 0,
                  child: const Icon(
                    Icons.thumb_up,
                    size: 15,
                  )),
              Visibility(
                  visible: video.likeCount > 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(compactCurrency.format(video.likeCount)),
                  )),
              Visibility(
                  visible: video.viewCount > 0,
                  child: const Icon(
                    Icons.visibility,
                    size: 15,
                  )),
              Visibility(
                  visible: video.viewCount > 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(compactCurrency.format(video.viewCount)),
                  )),
              Expanded(
                  child: Text(
                video.publishedText,
                textAlign: TextAlign.end,
              )),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => openChannel(context),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorScheme.onSurface,
                      image: DecorationImage(image: NetworkImage(ImageObject.getBestThumbnail(video?.authorThumbnails)?.url ?? ''), fit: BoxFit.cover)),
                ),
              ),
            ),
            Expanded(child: GestureDetector(onTap: () => openChannel(context), child: Text(video.author))),
           SubscribeButton(channelId: video.authorId, subCount: video.subCountText,)
          ],
        ),
        Text(video.description),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/models/video.dart';

import '../../models/video.dart';
import '../../utils.dart';

class VideoInfo extends StatelessWidget {
  Video video;
  final Function() toggleSubscription;
  final bool isSubscribed;

  VideoInfo({super.key, required this.video, required this.toggleSubscription, required this.isSubscribed});

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
              Expanded(child: Text(video.publishedText)),
              Visibility(visible: video.likeCount > 0, child: const Icon(Icons.thumb_up,size: 15,)),
              Visibility(
                  visible: video.likeCount > 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(compactCurrency.format(video.likeCount)),
                  )),
              Visibility(visible: video.viewCount > 0, child: const Icon(Icons.visibility, size: 15,)),
              Visibility(
                  visible: video.viewCount > 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(compactCurrency.format(video.viewCount)),
                  ))
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: colorScheme.onSurface, image: DecorationImage(image: NetworkImage(video.getBestAuthorThumbnail()?.url ?? ''), fit: BoxFit.cover)),
              ),
            ),
            Expanded(child: Text(video.author)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 25,
                  child: FilledButton.tonal(
                    onPressed: toggleSubscription,
                    child: Row(
                      children: [
                        Icon(isSubscribed ? Icons.done : Icons.add),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('${(isSubscribed ? 'Subscribed' : 'Subscribe')} | ${video.subCountText}'),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
        Text(video.description),
      ],
    );
  }
}

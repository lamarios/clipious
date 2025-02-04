import 'package:clipious/globals.dart';
import 'package:clipious/utils/views/components/placeholders.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';

import '../../../videos/views/components/video_thumbnail.dart';

class PlaylistThumbnails extends StatelessWidget {
  final List<Video> videos;
  final List<Widget>? children;
  final double scale = 0.7;
  final int maxThumbs;
  final bool isPlaceHolder;

  const PlaylistThumbnails(
      {super.key,
      required this.videos,
      this.children,
      this.maxThumbs = 4,
      this.isPlaceHolder = false});

  List<Widget> getThumbs(BuildContext context, BoxConstraints constraints) {
    var thumbs = <Widget>[];
    var colors = Theme.of(context).colorScheme;

    var videosToUse = videos.where((element) => !element.filtered).toList();

    for (int i = 0; i < maxThumbs; i++) {
      thumbs.add(Transform.scale(
        scale: 1 - (i / (maxThumbs * 2)),
        child: Transform.translate(
          offset: Offset((i - 1) * constraints.maxWidth * 0.1,
              (i - 1) * constraints.maxHeight * 0.1),
          child: SizedBox(
            width: constraints.maxWidth * scale,
            height: constraints.maxHeight * scale,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Opacity(
                opacity: 1 - (i / (maxThumbs)),
                child: AnimatedCrossFade(
                  duration: animationDuration,
                  firstChild: isPlaceHolder
                      ? const ThumbnailPlaceHolder(
                          borderRadius: 10,
                        )
                      : videosToUse.length > i
                          ? VideoThumbnailView(
                              videoId: videosToUse[i].videoId,
                              thumbnails: videosToUse[i].thumbnails,
                            )
                          : const SizedBox.shrink(),
                  secondChild: Container(
                    decoration: BoxDecoration(
                        color: colors.secondaryContainer,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  crossFadeState: isPlaceHolder
                      ? CrossFadeState.showFirst
                      : videosToUse.length > i
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                ),
              ),
            ),
          ),
        ),
      ));
    }

    return thumbs.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(alignment: Alignment.center, children: [
          ...getThumbs(context, constraints),
          ...(children ?? [])
        ]);
      }),
    );
  }
}

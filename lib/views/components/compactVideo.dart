import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/views/components/videoThumbnail.dart';

import '../../models/baseVideo.dart';

class CompactVideo extends StatelessWidget {
  Function()? onTap;
  final BaseVideo video;
  bool? highlighted;
  List<Widget>? trailing;

  CompactVideo({Key? key, this.onTap, required this.video, this.trailing, this.highlighted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          decoration: BoxDecoration(color: (highlighted ?? false) ? colors.secondaryContainer : colors.background, borderRadius: BorderRadius.circular(10)),
          height: 70,
          duration: animationDuration,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                video.filtered
                    ? AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.visibility_off_outlined, color: colors.secondary.withOpacity(0.7), size: 15),
                        ),
                      )
                    : VideoThumbnailView(cacheKey: 'v-worst/${video.videoId}', videoId: video.videoId, thumbnailUrl: ImageObject.getWorstThumbnail(video.videoThumbnails)?.url ?? ''),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video.filtered ? '-' : video.title,
                          style: TextStyle(color: colors.primary, overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          video.author ?? '',
                          style: TextStyle(color: colors.secondary, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
                ...trailing ?? []
              ],
            ),
          ),
        ));
  }
}

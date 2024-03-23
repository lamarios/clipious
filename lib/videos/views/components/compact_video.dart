import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/models/image_object.dart';
import 'package:invidious/videos/states/compact_video.dart';
import 'package:invidious/videos/views/components/video_thumbnail.dart';

import '../../models/base_video.dart';
import 'offline_video_thumbnail.dart';

const double compactVideoHeight = 70;

class CompactVideo extends StatelessWidget {
  final Function()? onTap;
  final BaseVideo? video;
  final DownloadedVideo? offlineVideo;
  final bool? highlighted;
  final List<Widget>? trailing;

  const CompactVideo(
      {super.key,
      this.onTap,
      this.video,
      this.trailing,
      this.highlighted,
      this.offlineVideo})
      : assert(video == null || offlineVideo == null,
            'cannot provide both video and offline video\n');

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    String title = video?.title ?? offlineVideo?.title ?? '';
    String author = video?.author ?? offlineVideo?.author ?? '';
    String videoId = video?.videoId ?? offlineVideo?.videoId ?? '';

    return BlocProvider(
      create: (context) =>
          CompactVideoCubit(CompactVideoState(offlineVideo: offlineVideo)),
      child: BlocBuilder<CompactVideoCubit, CompactVideoState>(
          builder: (context, _) {
        return InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(bottom: innerHorizontalPadding),
              child: SizedBox(
                height: compactVideoHeight,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedFractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        duration: animationDuration * 2,
                        widthFactor: (highlighted ?? false) ? 1 : 0,
                        curve: Curves.easeInOutQuad,
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                              color: (highlighted ?? false)
                                  ? colors.secondaryContainer
                                  : colors.background,
                              borderRadius: BorderRadius.circular(10)),
                          duration: animationDuration * 2,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Row(
                        children: [
                          video?.filtered ?? false
                              ? AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: colors.secondaryContainer,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(Icons.visibility_off_outlined,
                                        color:
                                            colors.secondary.withOpacity(0.7),
                                        size: 15),
                                  ),
                                )
                              : video != null
                                  ? VideoThumbnailView(
                                      videoId: videoId,
                                      thumbnailUrl:
                                          video?.deArrowThumbnailUrl ??
                                              ImageObject.getWorstThumbnail(
                                                      video?.videoThumbnails)
                                                  ?.url ??
                                              '')
                                  : offlineVideo != null
                                      ? OfflineVideoThumbnail(
                                          video: offlineVideo!,
                                        )
                                      : const SizedBox.shrink(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    video?.filtered ?? false
                                        ? '**********'
                                        : title,
                                    style: TextStyle(
                                        color: colors.primary,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(
                                    author,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall
                                        ?.copyWith(color: colors.secondary),
                                  ),
                                  // if(offlineVideo?.folder != null) Icon(Icons.folder_copy_outlined, size: 15, color: colors.secondary,)
                                ],
                              ),
                            ),
                          ),
                          ...trailing ?? []
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      }),
    );
  }
}

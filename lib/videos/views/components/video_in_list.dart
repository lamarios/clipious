import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:invidious/videos/states/video_in_list.dart';
import 'package:invidious/videos/views/components/offline_video_thumbnail.dart';
import 'package:invidious/videos/views/components/video_modal_sheet.dart';
import 'package:invidious/videos/views/components/video_thumbnail.dart';
import 'package:logging/logging.dart';

import '../../../downloads/models/downloaded_video.dart';
import '../../../downloads/states/download_manager.dart';
import '../../../utils.dart';
import '../../../utils/models/image_object.dart';
import '../screens/video.dart';
import 'video_metrics.dart';

final log = Logger('VideoInList');

class VideoListItem extends StatelessWidget {
  final VideoInList? video;
  final DownloadedVideo? offlineVideo;
  final bool small;

  const VideoListItem({super.key, this.video, this.offlineVideo, animateDownload = false, this.small = false})
      : assert(video == null || offlineVideo == null, 'cannot provide both video and offline video\n');

  openVideo(BuildContext context) {
    if (video != null) {
      var cubit = context.read<VideoInListCubit>();
      if (cubit.state.video!.filtered) {
        cubit.showVideoDetails();
      } else {
        navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_VIDEO, builder: (context) => VideoView(videoId: video!.videoId)));
      }
    } else if (offlineVideo != null) {
      context.read<PlayerCubit>().playOfflineVideos([offlineVideo!]);
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    var textTheme = Theme.of(context).textTheme;

    TextStyle filterStyle = (textTheme.bodySmall ?? const TextStyle()).copyWith(color: colorScheme.secondary.withOpacity(0.7));
    var downloadManager = context.read<DownloadManagerCubit>();

    String title = video?.title ?? offlineVideo?.title ?? '';
    String author = video?.author ?? offlineVideo?.author ?? '';
    String videoId = video?.videoId ?? offlineVideo?.videoId ?? '';

    return BlocProvider(
      create: (context) => VideoInListCubit(VideoInListState(video: video, offlineVideo: offlineVideo)),
      child: BlocBuilder<VideoInListCubit, VideoInListState>(
        builder: (context, _) => BlocListener<PlayerCubit, PlayerState>(
          listenWhen: (previous, current) => _.video != null && current.currentlyPlaying?.videoId == video!.videoId && previous.position != current.position,
          listener: (context, state) => context.read<VideoInListCubit>().updateProgress(),
          child: InkWell(
            onTap: () => openVideo(context),
            onLongPress: _.video == null || _.video!.filtered ? null : () => VideoModalSheet.showVideoModalSheet(context, video!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                (_.video?.filtered ?? false)
                    ? AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(small ? 5 : 10),
                          ),
                          child: small
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 10,
                                  color: colorScheme.secondary,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      locals.videoFiltered,
                                      style: filterStyle,
                                    ),
                                    ...video!.matchedFilters
                                        .map((e) => Text(
                                              e.localizedLabel(locals),
                                              style: filterStyle,
                                            ))
                                        .toList(growable: false),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Text(
                                        locals.videoFilterTapToReveal,
                                        style: filterStyle,
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      )
                    : video != null
                        ? VideoThumbnailView(
                            videoId: video!.videoId,
                            thumbnailUrl: ImageObject.getBestThumbnail(video!.videoThumbnails)?.url ?? '',
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(small ? 5 : 10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                                          child: AnimatedOpacity(
                                            duration: animationDuration,
                                            opacity: _.progress > 0.1 ? 1 : 0,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              width: double.infinity,
                                              height: small ? 1 : 5,
                                              decoration: BoxDecoration(
                                                color: colorScheme.secondaryContainer,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: AnimatedFractionallySizedBox(
                                                  widthFactor: _.progress > 0 ? _.progress : 0,
                                                  heightFactor: 1,
                                                  duration: const Duration(milliseconds: 750),
                                                  curve: Curves.easeInOutQuad,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: colorScheme.primary,
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (!small)
                                        Visibility(
                                          visible: (video?.lengthSeconds ?? offlineVideo?.lengthSeconds ?? 0) > 0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 25,
                                              decoration: BoxDecoration(color: Colors.black.withOpacity(0.75), borderRadius: BorderRadius.circular(5)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(
                                                  prettyDuration(Duration(seconds: video?.lengthSeconds ?? offlineVideo?.lengthSeconds ?? 0)),
                                                  style: textTheme.bodySmall?.copyWith(color: Colors.white),
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
                          )
                        : OfflineVideoThumbnail(video: offlineVideo!),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (_.video?.filtered ?? false) ? '**********' : title,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: small ? 1 : 2,
                            style: (small ? textTheme.labelSmall : textTheme.bodyMedium)?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.normal),
                          ),
                          InkWell(
                            onTap: () {
                              navigatorKey.currentState?.pushNamed(PATH_CHANNEL, arguments: video?.authorId ?? offlineVideo?.authorUrl ?? '');
                            },
                            child: Text(
                              author,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: (small ? textTheme.labelSmall : textTheme.bodyMedium)?.copyWith(color: colorScheme.secondary),
                            ),
                          ),
                          if (!small && video != null)
                            VideoMetrics(
                              viewCount: video!.viewCount,
                              publishedText: video!.publishedText,
                              style: textTheme.bodySmall,
                              iconSize: 13,
                            )
                        ],
                      ),
                    ),
                    if (!small && video != null)
                      InkWell(
                        onTap: (_.video?.filtered ?? true) ? null : () => VideoModalSheet.showVideoModalSheet(context, video!),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.more_vert),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

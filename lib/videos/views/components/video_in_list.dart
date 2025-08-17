import 'package:auto_route/auto_route.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/player/states/player.dart';
import 'package:clipious/router.dart';
import 'package:clipious/utils/views/components/navigation_switcher.dart';
import 'package:clipious/videos/states/video_in_list.dart';
import 'package:clipious/videos/views/components/offline_video_thumbnail.dart';
import 'package:clipious/videos/views/components/video_modal_sheet.dart';
import 'package:clipious/videos/views/components/video_thumbnail.dart';
import 'package:logging/logging.dart';

import '../../../downloads/models/downloaded_video.dart';
import '../../../utils.dart';
import '../../../utils/models/image_object.dart';
import 'video_metrics.dart';

final log = Logger('VideoInList');

class VideoListItem extends StatelessWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool small;
  final bool showMetrics;
  final Function(BuildContext context, Video video)? showVideoModalSheet;
  final Function(BuildContext context, Video video)? openVideoOverride;
  final bool allowModalSheet;

  const VideoListItem(
      {super.key,
      this.video,
      this.offlineVideo,
      animateDownload = false,
      this.small = false,
      this.showMetrics = true,
      this.showVideoModalSheet,
      this.allowModalSheet = true,
      this.openVideoOverride})
      : assert(video == null || offlineVideo == null,
            'cannot provide both video and offline video\n');

  openVideo(BuildContext context) {
    if (video != null) {
      if (openVideoOverride != null) {
        openVideoOverride!(context, video!);
      } else {
        var cubit = context.read<VideoInListCubit>();
        if (cubit.state.video!.filtered) {
          cubit.showVideoDetails();
        } else {
          if (!(cubit.state.video!.isUpcoming ?? false)) {
            AutoRouter.of(context).push(VideoRoute(videoId: video!.videoId));
          }
        }
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

    TextStyle filterStyle = (textTheme.bodySmall ?? const TextStyle())
        .copyWith(color: colorScheme.secondary.withOpacity(0.7));

    String title = video?.title ?? offlineVideo?.title ?? '';
    String author = video?.author ?? offlineVideo?.author ?? '';

    return BlocProvider(
      create: (context) => VideoInListCubit(
          VideoInListState(video: video, offlineVideo: offlineVideo)),
      child: BlocBuilder<VideoInListCubit, VideoInListState>(
        builder: (context, state) => BlocListener<PlayerCubit, PlayerState>(
          listenWhen: (previous, current) =>
              state.video != null &&
              current.currentlyPlaying?.videoId == video!.videoId &&
              previous.position != current.position,
          listener: (context, state) =>
              context.read<VideoInListCubit>().updateProgress(),
          child: InkWell(
            onTap: () => openVideo(context),
            onLongPress: (video?.isUpcoming ?? false) ||
                    !allowModalSheet ||
                    state.video == null ||
                    state.video!.filtered
                ? null
                : () => showVideoModalSheet != null
                    ? showVideoModalSheet!(context, video!)
                    : VideoModalSheet.showVideoModalSheet(context, video!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                (state.video?.filtered ?? false)
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
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        locals.videoFiltered,
                                        style: filterStyle,
                                      ),
                                      ...video!.matchedFilters.map((e) => Text(
                                            e.localizedLabel(locals, context),
                                            style: filterStyle,
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: Text(
                                          locals.videoFilterTapToReveal,
                                          style: filterStyle,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ),
                      )
                    : video != null
                        ? VideoThumbnailView(
                            videoId: video!.videoId,
                            thumbnails: video!.deArrowThumbnailUrl != null
                                ? [video!.deArrowThumbnailUrl!]
                                : ImageObject.getThumbnailUrlsByPreferredOrder(
                                    video!.videoThumbnails),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(small ? 5 : 10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: video!.isUpcoming ?? false
                                    ? []
                                    : [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: NavigationSwitcher(
                                                child: state.progress > 0.05
                                                    ? Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      4.0,
                                                                  vertical: 8),
                                                          child:
                                                              AnimatedContainer(
                                                            curve: Curves
                                                                .easeOutQuad,
                                                            duration:
                                                                animationDuration,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            constraints: state
                                                                        .progress ==
                                                                    1
                                                                ? const BoxConstraints(
                                                                    maxWidth:
                                                                        20)
                                                                : const BoxConstraints(
                                                                    maxWidth:
                                                                        1200),
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                state.progress ==
                                                                        1
                                                                    ? 20
                                                                    : small
                                                                        ? 1
                                                                        : 5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: colorScheme
                                                                  .secondaryContainer,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            child:
                                                                AnimatedFractionallySizedBox(
                                                                    widthFactor:
                                                                        state.progress >
                                                                                0
                                                                            ? state
                                                                                .progress
                                                                            : 0,
                                                                    heightFactor:
                                                                        1,
                                                                    duration:
                                                                        animationDuration,
                                                                    curve: Curves
                                                                        .easeInOutQuad,
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: state.progress ==
                                                                                1
                                                                            ? colorScheme.primaryContainer
                                                                            : colorScheme.primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                      child:
                                                                          AnimatedCrossFade(
                                                                        crossFadeState: state.progress ==
                                                                                1
                                                                            ? CrossFadeState.showFirst
                                                                            : CrossFadeState.showSecond,
                                                                        duration:
                                                                            animationDuration,
                                                                        secondChild:
                                                                            const SizedBox.shrink(),
                                                                        firstChild:
                                                                            Icon(
                                                                          Icons
                                                                              .check,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              colorScheme.primary,
                                                                        ),
                                                                      ),
                                                                    )),
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                              ),
                                            ),
                                            if (!small)
                                              Visibility(
                                                visible: (video
                                                            ?.lengthSeconds ??
                                                        offlineVideo
                                                            ?.lengthSeconds ??
                                                        0) >
                                                    0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.75),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        prettyDurationCustom(Duration(
                                                            seconds: video
                                                                    ?.lengthSeconds ??
                                                                offlineVideo
                                                                    ?.lengthSeconds ??
                                                                0)),
                                                        style: textTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white),
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
                            (state.video?.filtered ?? false)
                                ? '**********'
                                : title,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: small ? 1 : 2,
                            style: (small
                                    ? textTheme.labelSmall
                                    : textTheme.bodyMedium)
                                ?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.normal),
                          ),
                          InkWell(
                            onTap: () {
                              AutoRouter.of(context).push(ChannelRoute(
                                  channelId: video?.authorId ??
                                      offlineVideo?.authorUrl ??
                                      ''));
                            },
                            child: Text(
                              author,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: (small
                                      ? textTheme.labelSmall
                                      : textTheme.bodyMedium)
                                  ?.copyWith(color: colorScheme.secondary),
                            ),
                          ),
                          if (showMetrics && !small && video != null)
                            VideoMetrics(
                              video: video,
                              style: textTheme.bodySmall,
                              showDuration: false,
                              iconSize: 13,
                            )
                        ],
                      ),
                    ),
                    if (!(video?.isUpcoming ?? false) &&
                        allowModalSheet &&
                        !small &&
                        video != null)
                      InkWell(
                        onTap: (state.video?.filtered ?? true)
                            ? null
                            : () => showVideoModalSheet != null
                                ? showVideoModalSheet!(context, video!)
                                : VideoModalSheet.showVideoModalSheet(
                                    context, video!),
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

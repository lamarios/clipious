import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/views/screens/tvHome.dart';
import 'package:invidious/channels/views/tv/screens/channel.dart';
import 'package:invidious/downloads/states/download_manager.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/player/views/tv/screens/tvPlayerView.dart';
import 'package:invidious/subscription_management/view/tv/tv_subscribe_button.dart';
import 'package:invidious/utils/models/paginatedList.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';
import 'package:invidious/utils/views/tv/components/tv_expandable_text.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_item_list.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:invidious/videos/views/components/video_metrics.dart';

import '../../../../player/states/player.dart';
import '../../../../utils/models/image_object.dart';
import '../../../models/video.dart';
import '../../../states/tv_video.dart';
import '../../../states/video.dart';
import '../../components/video_thumbnail.dart';

class TvVideoView extends StatelessWidget {
  final String videoId;

  const TvVideoView({Key? key, required this.videoId}) : super(key: key);

  playVideo(BuildContext context, Video video) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => TvPlayerView(videos: [video, ...video.recommendedVideos])));
  }

  showChannel(BuildContext context, String channelId) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvChannelView(channelId: channelId),
    ));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;

    var downloadManager = context.read<DownloadManagerCubit>();
    var player = context.read<PlayerCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => VideoCubit(VideoState(videoId: videoId), downloadManager, player)),
        BlocProvider(
          create: (context) => TvVideoCubit(TvVideoState()),
        )
      ],
      child: Scaffold(body: Builder(builder: (context) {
        var tvState = context.watch<TvVideoCubit>().state;
        var videoState = context.watch<VideoCubit>().state;
        var tvCubit = context.read<TvVideoCubit>();
        var videoCubit = context.read<VideoCubit>();

        return DefaultTextStyle(
          style: textTheme.bodyLarge!,
          child: AnimatedCrossFade(
            crossFadeState: videoState.loadingVideo || videoState.error.isNotEmpty ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: animationDuration,
            firstChild: videoState.error.isNotEmpty
                ? Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        videoState.error == coulnotLoadVideos ? locals.couldntLoadVideo : videoState.error,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                  )
                : const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator())),
            secondChild: videoState.video == null
                ? const SizedBox.shrink()
                : Stack(
                    children: [
                      videoState.video == null
                          ? Container(color: colors.background)
                          : VideoThumbnailView(
                              videoId: videoState.video!.videoId, decoration: const BoxDecoration(), thumbnailUrl: ImageObject.getBestThumbnail(videoState.video?.videoThumbnails)?.url ?? ''),
                      AnimatedPositioned(
                        top: tvState.showImage ? 315 : 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        duration: animationDuration,
                        curve: Curves.easeInOutQuad,
                        child: TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: tvState.showImage ? 0 : overlayBlur),
                            duration: animationDuration,
                            curve: Curves.easeInOutQuad,
                            builder: (context, value, child) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: value,
                                  sigmaY: value,
                                ),
                                child: TvOverscan(
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: colors.background.withOpacity(overlayBackgroundOpacity)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SingleChildScrollView(
                                        controller: tvState.scrollController,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 16.0),
                                                    child: TvButton(
                                                      autofocus: true,
                                                      onFocusChanged: (focus) {
                                                        if (focus) {
                                                          tvCubit.scrollUp();
                                                        } else {
                                                          tvCubit.scrollDown();
                                                        }
                                                      },
                                                      onPressed: (context) => playVideo(context, videoState.video!),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(15.0),
                                                        child: Icon(
                                                          Icons.play_arrow,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          videoState.video!.title,
                                                          maxLines: 1,
                                                          style: textTheme.headlineMedium!.copyWith(color: colors.primary),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        VideoMetrics(
                                                          video: videoState.video!,
                                                          dislikes: videoState.getDislikes ? videoState.dislikes : null,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 10.0),
                                              child: ListView(physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, children: [
                                                Row(
                                                  children: [
                                                    TvButton(
                                                      onPressed: (context) => showChannel(context, videoState.video?.authorId ?? ''),
                                                      unfocusedColor: colors.background.withOpacity(0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Thumbnail(
                                                            thumbnailUrl: ImageObject.getBestThumbnail(videoState.video?.authorThumbnails)?.url ?? '',
                                                            width: 40,
                                                            height: 40,
                                                            id: 'author-small-${videoState.video?.authorId}',
                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8.0, right: 20),
                                                            child: Text(videoState.video?.author ?? ''),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                      child: TvSubscribeButton(channelId: videoState.video?.authorId ?? '', subCount: videoState.video?.subCountText ?? ''),
                                                    ),
                                                    Expanded(
                                                      child: Container(),
                                                    ),
                                                    AnimatedOpacity(
                                                      opacity: tvState.showImage ? 1 : 0,
                                                      duration: animationDuration,
                                                      child: Icon(
                                                        Icons.expand_more,
                                                        size: 50,
                                                        color: colors.primary.withOpacity(0.2),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 40.0),
                                                  child: TvExpandableText(
                                                    text: videoState.video?.description ?? '',
                                                    maxLines: 3,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10.0),
                                                  child: Text(
                                                    locals.recommended,
                                                    style: textTheme.titleLarge!,
                                                  ),
                                                ),
                                                TvHorizontalVideoList(
                                                    paginatedVideoList: FixedItemList<VideoInList>(videoState.video?.recommendedVideos
                                                            .map((e) => VideoInList(e.title, e.videoId, e.lengthSeconds, 0, e.author, '', 'authorUrl', 0, '', e.videoThumbnails))
                                                            .toList() ??
                                                        []))
                                              ]),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
          ),
        );
      })),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvChannelView.dart';
import 'package:invidious/views/tv/tvExpandableText.dart';
import 'package:invidious/views/tv/tvHome.dart';
import 'package:invidious/views/tv/tvHorizontalVideoList.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvPlayerView.dart';
import 'package:invidious/views/tv/tvSubscribeButton.dart';
import 'package:invidious/views/video/videoMetrics.dart';

import '../../controllers/tvVideoController.dart';
import '../../controllers/videoController.dart';
import '../../models/imageObject.dart';
import '../../models/video.dart';
import '../components/videoThumbnail.dart';

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
    return Scaffold(
        body: GetBuilder<TvVideoController>(
            global: false,
            init: TvVideoController(videoId: videoId),
            builder: (_) => DefaultTextStyle(
                  style: textTheme.bodyLarge!,
                  child: AnimatedCrossFade(
                    crossFadeState: _.loadingVideo || _.error.isNotEmpty ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: animationDuration,
                    firstChild: _.error.isNotEmpty
                        ? Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                _.error == coulnotLoadVideos ? locals.couldntLoadVideo : _.error,
                                style: textTheme.bodyLarge,
                              ),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                    secondChild: _.video == null
                        ? const SizedBox.shrink()
                        : Stack(
                            children: [
                              _.video == null
                                  ? Container(color: colors.background)
                                  : VideoThumbnailView(videoId: _.video!.videoId, decoration: const BoxDecoration(), thumbnailUrl: ImageObject.getBestThumbnail(_.video?.videoThumbnails)?.url ?? ''),
                              AnimatedPositioned(
                                top: _.showImage ? 350 : 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                duration: animationDuration,
                                curve: Curves.easeInOutQuad,
                                child: TweenAnimationBuilder(
                                    tween: Tween<double>(begin: 0, end: _.showImage ? 0 : overlayBlur),
                                    duration: animationDuration,
                                    curve: Curves.easeInOutQuad,
                                    builder: (context, value, child) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: value,
                                          sigmaY: value,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(color: colors.background.withOpacity(overlayBackgroundOpacity)),
                                          child: TvOverscan(
                                            child: SingleChildScrollView(
                                              controller: _.scrollController,
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
                                                                _.scrollUp();
                                                              } else {
                                                                _.scrollDown();
                                                              }
                                                            },
                                                            onPressed: (context) => playVideo(context, _.video!),
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
                                                                _.video!.title,
                                                                maxLines: 1,
                                                                style: textTheme.headlineMedium!.copyWith(color: colors.primary),
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                              VideoMetrics(
                                                                video: _.video!,
                                                                dislikes: _.getDislikes ? _.dislikes : null,
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
                                                            onPressed: (context) => showChannel(context, _.video?.authorId ?? ''),
                                                            unfocusedColor: colors.background.withOpacity(0),
                                                            focusedColor: colors.secondaryContainer,
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Thumbnail(
                                                                  thumbnailUrl: ImageObject.getBestThumbnail(_.video?.authorThumbnails)?.url ?? '',
                                                                  width: 40,
                                                                  height: 40,
                                                                  id: 'author-small-${_.video?.authorId}',
                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 8.0, right: 20),
                                                                  child: Text(_.video?.author ?? ''),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                            child: TvSubscribeButton(channelId: _.video?.authorId ?? '', subCount: _.video?.subCountText ?? ''),
                                                          ),
                                                          Expanded(
                                                            child: Container(),
                                                          ),
                                                          AnimatedOpacity(
                                                            opacity: _.showImage ? 1 : 0,
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
                                                          text: _.video?.description ?? '',
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
                                                          paginatedVideoList: FixedItemList<VideoInList>(_.video?.recommendedVideos
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
                                      );
                                    }),
                              ),
                            ],
                          ),
                  ),
                )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvChannelView.dart';
import 'package:invidious/views/tv/tvExpandableText.dart';
import 'package:invidious/views/tv/tvHorizontalVideoList.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvPlayerView.dart';
import 'package:invidious/views/tv/tvSubscribeButton.dart';

import '../../controllers/videoController.dart';
import '../../models/imageObject.dart';
import '../../models/video.dart';
import '../components/videoThumbnail.dart';

class TvVideoView extends StatelessWidget {
  final String videoId;

  const TvVideoView({Key? key, required this.videoId}) : super(key: key);

  playVideo(BuildContext context, Video video) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => TvPlayerView(video: video)));
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
        body: GetBuilder<VideoController>(
      global: false,
      init: VideoController(videoId: videoId),
      builder: (_) => TvOverscan(
        child: DefaultTextStyle(
          style: textTheme.bodyLarge!,
          child: _.loadingVideo
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 190,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          VideoThumbnailView(videoId: _.video!.videoId, thumbnailUrl: ImageObject.getBestThumbnail(_.video?.videoThumbnails)?.url ?? ''),
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: TvButton(
                                  autofocus: true,
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        _.video!.title,
                        maxLines: 2,
                        style: textTheme.headlineMedium!.copyWith(color: colors.primary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ListView(children: [
                          Row(
                            children: [
                              TvButton(
                                onPressed: (context) => showChannel(context, _.video?.authorId ?? ''),
                                unfocusedColor: colors.background,
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
                              paginatedVideoList: FixedItemList<VideoInList>(
                                  _.video?.recommendedVideos.map((e) => VideoInList(e.title, e.videoId, e.lengthSeconds, 0, e.author, '', 'authorUrl', 0, '', e.videoThumbnails)).toList() ?? []))
                        ]),
                      ),
                    )
                  ],
                ),
        ),
      ),
    ));
  }
}

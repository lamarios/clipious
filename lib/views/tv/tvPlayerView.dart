import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/tvPlayerController.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvHorizontalVideoList.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvPlayerSettings.dart';
import 'package:invidious/views/video/player.dart';

import '../../globals.dart';
import '../../main.dart';
import '../../models/baseVideo.dart';
import '../../models/imageObject.dart';
import '../components/videoThumbnail.dart';

class TvPlayerView extends StatelessWidget {
  final List<BaseVideo> videos;

  const TvPlayerView({Key? key, required this.videos}) : super(key: key);

  onVideoQueueSelected(BuildContext context, TvPlayerController _, VideoInList video) {
    _.playFromQueue(video);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;
    return Theme(
      data: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      child: Scaffold(
        body: GetBuilder<TvPlayerController>(
          init: TvPlayerController(videos: videos),
          builder: (_) => _.loading
              ? Container(
                  color: Colors.black,
                  child: const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : Focus(
                  autofocus: true,
                  onKeyEvent: (node, event) => _.handleRemoteEvents(node, event),
                  child: Stack(
                    children: [
                      VideoPlayer(
                        video: _.currentlyPlaying,
                        miniPlayer: false,
                        playNow: true,
                        disableControls: true,
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: AnimatedOpacity(
                          opacity: _.controlsOpacity,
                          duration: animationDuration,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(1), Colors.black.withOpacity(0), Colors.black.withOpacity(1)])),
                          ),
                        ),
                      ),
                      Positioned(
                        top: TvOverscan.vertical,
                        right: TvOverscan.horizontal,
                        child: AnimatedOpacity(
                          opacity: _.buffering ? 1 : 0,
                          duration: animationDuration,
                          child: const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      Positioned(
                          child: TvOverscan(
                        child: _.showSettings ? const TvPlayerSettings() : const SizedBox.shrink(),
                      )),
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: _.showSettings
                              ? SizedBox.shrink()
                              : AnimatedOpacity(
                                  opacity: _.controlsOpacity,
                                  duration: animationDuration,
                                  child: TvOverscan(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _.currentlyPlaying.title,
                                          style: textTheme.headlineLarge,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Thumbnail(
                                                thumbnailUrl: ImageObject.getBestThumbnail(_.currentlyPlaying.authorThumbnails)?.url ?? '',
                                                width: 40,
                                                height: 40,
                                                id: 'author-small-${_.currentlyPlaying.authorId}',
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8.0, right: 20),
                                                child: Text(
                                                  _.currentlyPlaying.author ?? '',
                                                  style: textTheme.headlineSmall,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: AnimatedOpacity(
                          opacity: _.controlsOpacity,
                          duration: animationDuration,
                          child: TvOverscan(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _.currentlyPlaying.liveNow || _.showControls
                                    ? const SizedBox.shrink()
                                    : Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${prettyDuration(_.currentPosition)} / ${prettyDuration(_.videoLength)}',
                                            style: const TextStyle(color: Colors.white, fontSize: 24),
                                          )
                                        ],
                                      ),
                                _.showControls
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                                        child: FocusScope(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16.0),
                                                child: TvButton(
                                                  onPressed: (context) => _.togglePlayPause(),
                                                  unfocusedColor: Colors.transparent,
                                                  autofocus: true,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      _.isPlaying ? Icons.pause : Icons.play_arrow,
                                                      size: 50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: _.videos.length > 1,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 16.0),
                                                  child: TvButton(
                                                    onPressed: (context) => _.playPrevious(),
                                                    unfocusedColor: Colors.transparent,
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: Icon(
                                                        Icons.skip_previous,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16.0),
                                                child: TvButton(
                                                  unfocusedColor: Colors.transparent,
                                                  onPressed: (context) => _.fastRewind(),
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.fast_rewind,
                                                      size: 50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16.0),
                                                child: TvButton(
                                                  onPressed: (context) => _.fastForward(),
                                                  unfocusedColor: Colors.transparent,
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.fast_forward,
                                                      size: 50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: _.videos.length > 1,
                                                child: TvButton(
                                                  onPressed: (context) => _.playNext(),
                                                  unfocusedColor: Colors.transparent,
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.skip_next,
                                                      size: 50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16.0),
                                                child: TvButton(
                                                  onPressed: (context) => _.displayQueue(),
                                                  unfocusedColor: Colors.transparent,
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.video_library,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16.0),
                                                child: TvButton(
                                                  onPressed: (context) => _.displaySettings(),
                                                  unfocusedColor: Colors.transparent,
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.settings,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _.currentlyPlaying.liveNow
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.podcasts,
                                                    size: 15,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0),
                                                    child: Text(
                                                      locals.streamIsLive,
                                                      style: textTheme.bodyLarge,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Expanded(
                                            child: _.progress >= 0
                                                ? Container(
                                                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
                                                    child: AnimatedFractionallySizedBox(
                                                      alignment: Alignment.centerLeft,
                                                      duration: animationDuration,
                                                      widthFactor: _.progress,
                                                      child: Container(
                                                        height: 8,
                                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                                      ),
                                                    ))
                                                : const SizedBox.shrink())
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 0,
                          bottom: 50,
                          right: 0,
                          child: AnimatedSwitcher(
                              duration: animationDuration,
                              child: _.showQueue
                                  ? TvOverscan(
                                      child: FocusScope(
                                      autofocus: true,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            locals.videoQueue,
                                            style: textTheme.titleLarge,
                                          ),
                                          TvHorizontalVideoList(
                                              onSelect: (ctx, video) => onVideoQueueSelected(ctx, _, video),
                                              paginatedVideoList: FixedItemList(videos
                                                  .map((e) => VideoInList(e.title, e.videoId, e.lengthSeconds, null, e.author, e.authorId, e.authorUrl, null, null, e.videoThumbnails))
                                                  .toList())),
                                        ],
                                      ),
                                    ))
                                  : const SizedBox.shrink()))
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

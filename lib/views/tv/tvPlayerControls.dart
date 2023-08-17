import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/tvPlayerController.dart';
import 'package:invidious/controllers/tvPlayerControlsController.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_item_list.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';
import 'package:invidious/views/tv/tvPlayerSettings.dart';

import '../../controllers/interfaces/playerController.dart';
import '../../controllers/miniPayerController.dart';
import '../../globals.dart';
import '../../utils/models/image_object.dart';
import '../../utils/models/paginatedList.dart';
import '../../videos/models/video_in_list.dart';
import '../../utils.dart';
import '../../videos/views/components/video_thumbnail.dart';

class TvPlayerControls extends StatelessWidget {
  const TvPlayerControls({super.key});

  onVideoQueueSelected(BuildContext context, TvPlayerControlsController _, VideoInList video) {
    _.playFromQueue(video);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;

    return GetBuilder<TvPlayerControlsController>(
      global: false,
      init: TvPlayerControlsController(),
      builder: (_) {
        TvPlayerController? mpc = TvPlayerController.to();
        PlayerController? pc = mpc?.playerController;

        if (mpc == null || pc == null) {
          return const SizedBox.shrink();
        }

        return Focus(
          autofocus: true,
          onKeyEvent: (node, event) => _.handleRemoteEvents(node, event),
          child: Stack(
            children: [
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
                        gradient:
                            LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(1), Colors.black.withOpacity(0), Colors.black.withOpacity(1)])),
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
                      ? const SizedBox.shrink()
                      : AnimatedOpacity(
                          opacity: _.controlsOpacity,
                          duration: animationDuration,
                          child: TvOverscan(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mpc.currentlyPlaying?.title ?? '',
                                  style: textTheme.headlineLarge?.copyWith(color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Thumbnail(
                                        thumbnailUrl: ImageObject.getBestThumbnail(mpc.currentlyPlaying?.authorThumbnails)?.url ?? '',
                                        width: 40,
                                        height: 40,
                                        id: 'author-small-${mpc.currentlyPlaying?.authorId}',
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 20),
                                        child: Text(
                                          mpc.currentlyPlaying?.author ?? '',
                                          style: textTheme.headlineSmall?.copyWith(color: Colors.white),
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
                        _.displayControls
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                                child: FocusScope(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16.0),
                                        child: TvButton(
                                          onPressed: (context) => mpc.togglePlaying(),
                                          unfocusedColor: Colors.transparent,
                                          autofocus: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              mpc.isPlaying ? Icons.pause : Icons.play_arrow,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: mpc.videos.length > 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 16.0),
                                          child: TvButton(
                                            onPressed: (context) => mpc.playPrevious(),
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
                                        visible: mpc.videos.length > 1,
                                        child: TvButton(
                                          onPressed: (context) => mpc.playNext(),
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
                            (mpc.currentlyPlaying?.liveNow ?? false)
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
                                        : const SizedBox.shrink()),
                            if (!(mpc.currentlyPlaying?.liveNow ?? false))
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  '${prettyDuration(pc.position())} / ${prettyDuration(pc.duration())}',
                                  style: textTheme.titleLarge?.copyWith(color: Colors.white),
                                ),
                              )
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
                                      paginatedVideoList: FixedItemList(
                                          mpc!.videos.map((e) => VideoInList(e.title, e.videoId, e.lengthSeconds, null, e.author, e.authorId, e.authorUrl, null, null, e.videoThumbnails)).toList())),
                                ],
                              ),
                            ))
                          : const SizedBox.shrink()))
            ],
          ),
        );
      },
    );
  }
}

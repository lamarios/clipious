import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video.dart';
import 'package:invidious/views/video/player.dart';

import '../controllers/playlistController.dart';
import '../globals.dart';
import '../models/playlist.dart';

class PlaylistView extends StatelessWidget {
  final Playlist playlist;
  final bool canDeleteVideos;

  const PlaylistView({super.key, required this.playlist, required this.canDeleteVideos});

  deletePlayList(BuildContext context, PlaylistController controller) {
    var locals = AppLocalizations.of(context)!;
    okCancelDialog(context, locals.deletePlayListQ, locals.irreversibleAction, () async {
      await controller.deletePlaylist();

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  showPlayListVideoDialog(BuildContext context, PlaylistController controller, VideoInList v) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          var locals = AppLocalizations.of(context)!;
          return SizedBox(
            height: 100,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            removeVideoFromPlayList(context, controller, v);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        Text(
                          locals.removeFromPlayList,
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  openVideo(BuildContext context, String videoId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: ROUTE_VIDEO,
            builder: (context) => VideoView(
                  videoId: videoId,
                )));
  }

  removeVideoFromPlayList(BuildContext context, PlaylistController controller, VideoInList v) async {
    var locals = AppLocalizations.of(context)!;
    try {
      bool goBack = await controller.removeVideoFromPlayList(v);

      if (context.mounted && goBack) {
        Navigator.of(context).pop();
      }
    } catch (err) {
      if (err is InvidiousServiceError) {
        showAlertDialog(context, locals.error, [Text(err.message)]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    bool onBigScreen = getScreenWidth() > PHONE_MAX;

    return GetBuilder<PlaylistController>(
      global: false,
      init: PlaylistController(playlist: playlist, playlistItemHeight: 100),
      builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(
              _.playlist.title,
            ),
            scrolledUnderElevation: 0,
            actions: [
              canDeleteVideos
                  ? InkWell(
                      onTap: () => deletePlayList(context, _),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete,
                          color: colorScheme.secondary,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          backgroundColor: colorScheme.background,
          body: SafeArea(
              bottom: false,
              child: !_.loading && _.playlist.videos.isNotEmpty
                  ? Center(
                      child: Container(
                        constraints: onBigScreen ? const BoxConstraints(maxWidth: 600) : null,
                        child: Column(
                          children: [
                            AnimatedSwitcher(
                                duration: animationDuration,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: _.currentlyPlaying != null
                                            ? VideoPlayer(
                                                miniPlayer: false,
                                                video: _.currentlyPlaying!,
                                              )
                                            : const SizedBox.shrink(),
                                      )
                                    ]))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: _.playPreviousVideo,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Icon(
                                      Icons.skip_previous,
                                      color: colorScheme.secondary,
                                      size: 50,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: _.playNextVideo,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Icon(Icons.skip_next, color: colorScheme.secondary, size: 50),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                                child: ListView(
                              controller: _.scrollController,
                              children: _.playlist.videos
                                  .map((v) => Container(
                                        width: double.infinity,
                                        height: _.playlistItemHeight,
                                        alignment: Alignment.center,
                                        child: Stack(
                                          children: [
                                            Visibility(
                                              visible: v.videoId == _.currentlyPlaying?.videoId,
                                              child: Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    alignment: Alignment.centerLeft,
                                                    color: colorScheme.secondaryContainer.withOpacity(0.5),
                                                    child: AnimatedFractionallySizedBox(
                                                      curve: Curves.linear,
                                                      heightFactor: 1,
                                                      widthFactor: _.progress,
                                                      duration: const Duration(seconds: 1),
                                                      child: Container(
                                                        color: colorScheme.primary.withOpacity(0.1),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () => _.playVideo(context, v),
                                                onLongPress: canDeleteVideos ? () => showPlayListVideoDialog(context, _, v) : null,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: SizedBox(
                                                        width: 100,
                                                        child: VideoThumbnailView(
                                                          cacheKey: 'v-worst/${v.videoId}',
                                                          videoId: v.videoId,
                                                          thumbnailUrl: ImageObject.getWorstThumbnail(v.videoThumbnails)?.url ?? '',
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            v.title,
                                                            style: TextStyle(color: colorScheme.primary),
                                                          ),
                                                          Text(
                                                            v.author ?? '',
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () => openVideo(context, v.videoId),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.exit_to_app,
                                                          color: colorScheme.primary,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ))
                          ],
                        ),
                      ),
                    )
                  : _.loading
                      ? Center(
                          child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: _.loadingProgress),
                          duration: animationDuration,
                          curve: Curves.easeInOutQuad,
                          builder: (context, value, child) => CircularProgressIndicator(
                            value: value > 0 ? value : null,
                          ),
                        ))
                      : Container(alignment: Alignment.center, child: Text(locals.noVideoInPlayList)))),
    );
  }
}

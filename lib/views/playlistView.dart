import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/components/miniPlayerAware.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video.dart';
import 'package:invidious/views/video/player.dart';

import '../controllers/playlistController.dart';
import '../globals.dart';
import '../models/playlist.dart';
import 'components/addToQueueButton.dart';

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
          return MiniPlayerAware(
            child: SizedBox(
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

  List<Widget> buildThumbnails(BuildContext context, PlaylistController _) {
    List<Widget> thumbs = [];

    ColorScheme colors = Theme.of(context).colorScheme;
    List<VideoInList> videosToUse = _.playlist.videos;
    for (int i = 2; i >= 0; i--) {
      // for (VideoInList video in playlist.videos) {
      thumbs.add(Align(
        alignment: Alignment(i * 0.5, i * 0.5),
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Opacity(
              opacity: 1 - (0.3 * i),
              child: videosToUse.length > i
                  ? VideoThumbnailView(
                      videoId: videosToUse[i].videoId,
                      thumbnailUrl: ImageObject.getBestThumbnail(videosToUse[i].videoThumbnails)?.url ?? '',
                    )
                  : Container(
                      decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                    ),
            ),
          ),
        ),
      ));
    }

    return thumbs;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    return GetBuilder<PlaylistController>(
      global: false,
      init: PlaylistController(playlist: playlist, playlistItemHeight: 100),
      builder: (_) {
        return MiniPlayerAware(
          child: Scaffold(
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
                            constraints: BoxConstraints(maxWidth: tabletMaxVideoWidth),
                            child: Column(
                              children: [
                                AnimatedSwitcher(
                                    duration: animationDuration,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  ...buildThumbnails(context, _),
                                                  IconButton(
                                                    key: const ValueKey('nt-playing'),
                                                    onPressed: _.play,
                                                    icon: const Icon(
                                                      Icons.play_arrow,
                                                      size: 100,
                                                    ),
                                                    color: colorScheme.primary,
                                                  ),
                                                  Positioned(
                                                      right: 0,
                                                      bottom: 0,
                                                      child: AddToQueueButton(
                                                        videos: _.playlist.videos,
                                                      ))
                                                ],
                                              ))
                                        ]))),
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
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
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
      },
    );
  }
}

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/components/compactVideo.dart';
import 'package:invidious/views/components/miniPlayerAware.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video.dart';
import 'package:invidious/views/video/player.dart';

import '../controllers/playlistController.dart';
import '../globals.dart';
import '../models/playlist.dart';
import 'components/addToQueueButton.dart';
import 'components/playButton.dart';

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

  openVideo(String videoId) {
    navigatorKey.currentState?.push(MaterialPageRoute(
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
    List<VideoInList> videosToUse = _.playlist.videos.where((element) => !element.filtered).toList();
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
        return Scaffold(
            appBar: AppBar(
              backgroundColor: colorScheme.background,
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
                                                PlayButton(
                                                  onPressed: _.play,
                                                ),
                                                Positioned(
                                                    right: 5,
                                                    bottom: 3,
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
                                    .map((v) => SwipeActionCell(
                                        key: ValueKey('swipe-${v.videoId}'),
                                        trailingActions: canDeleteVideos
                                            ? [
                                                SwipeAction(
                                                  icon: const Icon(Icons.delete, color: Colors.white),
                                                  performsFirstActionWithFullSwipe: true,
                                                  onTap: (handler) async {
                                                    await handler(true);
                                                    removeVideoFromPlayList(context, _, v);
                                                  },
                                                )
                                              ]
                                            : null,
                                        child: CompactVideo(
                                          video: v,
                                          onTap: () => openVideo(v.videoId),
                                          key: ValueKey(v.videoId),
                                        )))
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
                        : Container(alignment: Alignment.center, child: Text(locals.noVideoInPlayList))));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/components/compactVideo.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/playlists/playlistThumbnail.dart';
import 'package:invidious/views/video.dart';

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
                                        SizedBox(
                                          height: 250,
                                          child: PlaylistThumbnails(
                                            videos: _.playlist.videos,
                                            bestThumbnails: true,
                                            children: [
                                              PlayButton(
                                                onPressed: (isAudio) => _.play(isAudio),
                                              ),
                                              Positioned(
                                                  right: 5,
                                                  bottom: 3,
                                                  child: AddToQueueButton(
                                                    videos: _.playlist.videos,
                                                  ))
                                            ],
                                          ),
                                        )
                                      ]))),
                              Expanded(
                                  child: ListView(
                                controller: _.scrollController,
                                children: _.playlist.videos
                                    .where((element) => !element.filterHide)
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
                              value: value > 0 && value < 1 ? value : null,
                            ),
                          ))
                        : Container(alignment: Alignment.center, child: Text(locals.noVideoInPlayList))));
      },
    );
  }
}

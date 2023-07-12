import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playlistItemController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/playlistView.dart';
import 'package:invidious/views/tv/tvVideoGridView.dart';

class PlaylistItem extends StatelessWidget {
  final Playlist playlist;
  final bool canDeleteVideos;
  final bool isTv;

  const PlaylistItem({super.key, required this.playlist, required this.canDeleteVideos, this.isTv = false});

  openPlayList(BuildContext context) {
    navigatorKey.currentState?.push(MaterialPageRoute(
        settings: ROUTE_PLAYLIST,
        builder: (context) => PlaylistView(
              playlist: playlist,
              canDeleteVideos: canDeleteVideos,
            )));
  }

  openTvPlaylist(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (builder) => TvGridView(
        paginatedVideoList: FixedItemList<VideoInList>(playlist.videos),
        title: playlist.title,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    return GetBuilder<PlaylistItemController>(
      init: PlaylistItemController(playlist: playlist),
      global: false,
      builder: (_) {
        List<Widget> thumbs = [];
        List<VideoInList> videosToUse = _.videos.isNotEmpty ? _.videos : playlist.videos;
        videosToUse = videosToUse.where((element) => !element.filtered).toList();

        for (int i = 0; i < 3; i++) {
          // for (VideoInList video in playlist.videos) {
          thumbs.add(Positioned(
            top: (10 * i).toDouble(),
            left: (15 * i).toDouble(),
            child: SizedBox(
              width: isTv ? 200 : 100,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Opacity(
                  opacity: 1 - (0.3 * i),
                  child: videosToUse.length > i
                      ? VideoThumbnailView(
                          cacheKey: 'v-${isTv ? 'best' : 'worst'}/${videosToUse[i].videoId}',
                          videoId: videosToUse[i].videoId,
                          thumbnailUrl: (isTv ? ImageObject.getBestThumbnail(videosToUse[i].videoThumbnails)?.url : ImageObject.getWorstThumbnail(videosToUse[i].videoThumbnails)?.url) ?? '',
                        )
                      : Container(
                          decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                        ),
                ),
              ),
            ),
          ));
        }

        thumbs = thumbs.reversed.toList();

        if (isTv) {
          return Focus(
            onKeyEvent: (node, event) => onTvSelect(event, context, (_) => openTvPlaylist(context)),
            autofocus: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (ctx) {
                  final bool hasFocus = Focus.of(ctx).hasFocus;

                  return GestureDetector(
                    child: AnimatedScale(
                      curve: Curves.easeInOutQuad,
                      duration: animationDuration ~/2,
                      scale: hasFocus ? 1: 0.9,
                      child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: hasFocus ? colors.primaryContainer : colors.background,
                          ),
                          duration: animationDuration,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 400,
                                    height: 160,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20.0, right: 8.0, top: 8.0, bottom: 8.0),
                                      child: Stack(
                                        children: thumbs,
                                      ),
                                    )),
                                Expanded(
                                    child: Text(
                                      playlist.title,
                                      style: TextStyle(
                                          color: colors.primary,
                                          fontSize: 20.0
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(locals.nVideos(playlist.videoCount))
                                ),
                              ],
                            ),
                          )),
                  );
                }
              )
            ),
          );
        } else {
          return InkWell(
            onTap: () => openPlayList(context),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 200,
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: thumbs,
                            ),
                          )),
                      Expanded(
                          child: Text(
                            playlist.title,
                            style: TextStyle(color: colors.primary),
                          )),
                      Text(locals.nVideos(playlist.videoCount)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playlistItemController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/playlist.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/playlistView.dart';
import 'package:invidious/views/playlists/playlistThumbnail.dart';
import 'package:invidious/views/tv/tvPlaylistView.dart';

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
      builder: (context) => TvPlaylistView(playlist: playlist, canDeleteVideos: false),
    ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;

    return GetBuilder<PlaylistItemController>(
      init: PlaylistItemController(playlist: playlist),
      global: false,
      builder: (_) {
        List<VideoInList> videosToUse = _.videos.isNotEmpty ? _.videos : playlist.videos;

        if (isTv) {
          return Focus(
            onKeyEvent: (node, event) => onTvSelect(event, context, (_) => openTvPlaylist(context)),
            autofocus: false,
            child: AspectRatio(
              aspectRatio: 16 / 13,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(builder: (ctx) {
                    final bool hasFocus = Focus.of(ctx).hasFocus;

                    return GestureDetector(
                      child: AnimatedScale(
                          curve: Curves.easeInOutQuad,
                          duration: animationDuration ~/ 2,
                          scale: hasFocus ? 1 : 0.9,
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: hasFocus ? colors.primaryContainer : colors.background,
                            ),
                            duration: animationDuration,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 140,
                                      child: PlaylistThumbnails(
                                        videos: videosToUse,
                                        bestThumbnails: isTv,
                                      )),
                                  Expanded(
                                      child: Text(
                                    playlist.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.titleLarge?.copyWith(color: colors.primary),
                                  )),
                                  Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text(locals.nVideos(playlist.videoCount))),
                                ],
                              ),
                            ),
                          )),
                    );
                  })),
            ),
          );
        } else {
          return InkWell(
            onTap: () => openPlayList(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 95,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PlaylistThumbnails(videos: videosToUse, bestThumbnails: isTv),
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          playlist.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(color: colors.primary),
                        ),
                        Text(locals.nVideos(playlist.videoCount)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

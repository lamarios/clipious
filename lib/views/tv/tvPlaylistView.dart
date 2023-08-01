import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playlistController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/playlistView.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvPlayerView.dart';
import 'package:invidious/views/tv/tvVideoItem.dart';

import '../../controllers/tvPlaylistController.dart';

class TvPlaylistView extends PlaylistView {
  TvPlaylistView({required super.playlist, required super.canDeleteVideos});

  playPlaylist(BuildContext context, PlaylistController _) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => TvPlayerView(videos: _.playlist.videos)));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: TvOverscan(
        child: GetBuilder<TvPlaylistController>(
          global: false,
          init: TvPlaylistController(playlist: playlist, playlistItemHeight: 0),
          builder: (_) {
            return _.loading
                ? Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        value: _.loadingProgress,
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _.playlist.title,
                            style: textTheme.headlineLarge,
                          ),
                          AnimatedContainer(
                            duration: animationDuration,
                            curve: Curves.easeInOutQuad,
                            height: _.miniTop ? 50 : 130,
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Stack(
                                      children: buildThumbnails(context, _),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 32.0),
                                  child: TvButton(
                                    autofocus: true,
                                    onFocusChanged: (focus) {
                                      if (focus) {
                                        _.setMiniTop(false);
                                      } else {
                                        _.setMiniTop(true);
                                      }
                                    },
                                    onPressed: (context) => playPlaylist(context, _),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(
                                        Icons.play_arrow,
                                        size: _.miniTop ? 15 : 50,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      AnimatedPositioned(
                        duration: animationDuration,
                        top: _.miniTop ? 0 : 185,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          color: colors.background,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  locals.videos,
                                  style: textTheme.titleLarge,
                                ),
                              ),
                              Expanded(
                                child: GridView.count(
                                  controller: _.scrollController,
                                  childAspectRatio: 16 / 13,
                                  crossAxisCount: 3,
                                  children: _.playlist.videos.map((e) => TvVideoItem(video: e, autoFocus: false)).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}

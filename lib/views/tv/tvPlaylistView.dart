import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playlistController.dart';
import 'package:invidious/views/playlistView.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvPlayerView.dart';
import 'package:invidious/views/tv/tvVideoItem.dart';

class TvPlaylistView extends PlaylistView {
  TvPlaylistView({required super.playlist, required super.canDeleteVideos});

  playPlaylist(BuildContext context, PlaylistController _) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => TvPlayerView(videos: _.playlist.videos)));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: TvOverscan(
        child: GetBuilder<PlaylistController>(
          global: false,
          init: PlaylistController(playlist: playlist, playlistItemHeight: 0),
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
                : SingleChildScrollView(
                    controller: _.scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _.playlist.title,
                          style: textTheme.headlineLarge,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 200,
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
                                    _.scrollToTop();
                                  }
                                },
                                onPressed: (context) => playPlaylist(context, _),
                                child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            locals.videos,
                            style: textTheme.titleLarge,
                          ),
                        ),
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          controller: _.scrollController,
                          childAspectRatio: 16 / 13,
                          crossAxisCount: 3,
                          children: _.playlist.videos.map((e) => TvVideoItem(video: e, autoFocus: false)).toList(),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

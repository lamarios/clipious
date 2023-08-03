import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playlistController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/playlistView.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvHome.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvPlayerView.dart';
import 'package:invidious/views/tv/tvVideoItem.dart';

import '../../controllers/tvPlaylistController.dart';
import '../../models/baseVideo.dart';
import '../../models/imageObject.dart';
import '../components/videoThumbnail.dart';

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
      body: GetBuilder<TvPlaylistController>(
        global: false,
        init: TvPlaylistController(playlist: playlist, playlistItemHeight: 0),
        builder: (_) {
          return AnimatedCrossFade(
            crossFadeState: _.loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: animationDuration,
            firstChild: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  value: _.loadingProgress,
                ),
              ),
            ),
            secondChild: _.loading
                ? const SizedBox.shrink()
                : Stack(
                    children: [
                      CarouselSlider.builder(
                        itemCount: _.playlist.videos.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          BaseVideo video = _.playlist.videos[itemIndex];
                          return VideoThumbnailView(videoId: video.videoId, decoration: BoxDecoration(), thumbnailUrl: ImageObject.getBestThumbnail(video.videoThumbnails)?.url ?? '');
                        },
                        options: CarouselOptions(
                          autoPlayCurve: Curves.easeInOutQuad,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlay: _.showImage,
                        ),
                      ),
                      AnimatedPositioned(
                        duration: animationDuration,
                        curve: Curves.easeInOutQuad,
                        top: _.showImage ? 350 : 0,
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: _.showImage ? 0 : overlayBlur),
                            duration: animationDuration,
                            curve: Curves.easeInOutQuad,
                            builder: (context, value, child) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: value,
                                  sigmaY: value,
                                ),
                                child: Container(
                                  color: colors.background.withOpacity(overlayBackgroundOpacity),
                                  child: TvOverscan(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 16.0),
                                              child: TvButton(
                                                autofocus: true,
                                                onFocusChanged: (focus) {
                                                  _.setShowImage(focus);
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
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _.playlist.title,
                                                  style: textTheme.headlineLarge,
                                                ),
                                                Text(
                                                  locals.nVideos(_.playlist.videos.length),
                                                  style: textTheme.bodyLarge,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 16.0),
                                            child: GridView.count(
                                              controller: _.scrollController,
                                              childAspectRatio: 16 / 13,
                                              crossAxisCount: 3,
                                              children: _.playlist.videos.map((e) => TvVideoItem(video: e, autoFocus: false)).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}

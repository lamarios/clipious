import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clipious/app/views/tv/screens/tv_home.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/playlists/states/playlist.dart';
import 'package:clipious/playlists/views/screens/playlist.dart';
import 'package:clipious/router.dart';
import 'package:clipious/utils/views/components/placeholders.dart';
import 'package:clipious/utils/views/tv/components/tv_button.dart';
import 'package:clipious/utils/views/tv/components/tv_overscan.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:clipious/videos/views/tv/components/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';

import '../../../../player/states/player.dart';
import '../../../../videos/views/components/video_thumbnail.dart';

@RoutePage()
class TvPlaylistScreen extends PlaylistViewScreen {
  const TvPlaylistScreen(
      {super.key, required super.playlist, required super.canDeleteVideos});

  playPlaylist(BuildContext context, PlaylistState state) {
    AutoRouter.of(context).push(TvPlayerRoute(
        videos: state.playlist.videos
            .where((element) => !element.filterHide)
            .toList()));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var colors = Theme.of(context).colorScheme;
    var player = context.read<PlayerCubit>();
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => PlaylistCubit(
          PlaylistState(playlist: playlist, playlistItemHeight: 0), player),
      child: Scaffold(
        body: BlocBuilder<PlaylistCubit, PlaylistState>(
          builder: (context, playlistState) {
            var cubit = context.read<PlaylistCubit>();
            return Stack(
              children: [
                playlistState.playlist.videos.isNotEmpty
                    ? CarouselSlider.builder(
                        itemCount: playlistState.playlist.videos.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          Video video =
                              playlistState.playlist.videos[itemIndex];
                          return VideoThumbnailView(
                              videoId: video.videoId,
                              decoration: const BoxDecoration(),
                              thumbnails: video.thumbnails);
                        },
                        options: CarouselOptions(
                          autoPlayCurve: Curves.easeInOutQuad,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlay: playlistState.showImage,
                        ),
                      )
                    : Container(
                        color: colors.secondaryContainer,
                      ),
                AnimatedPositioned(
                  duration: animationDuration,
                  curve: Curves.easeInOutQuad,
                  top: playlistState.showImage ? 285 : 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: TweenAnimationBuilder(
                      tween: Tween<double>(
                          begin: 0,
                          end: playlistState.showImage ? 0 : overlayBlur),
                      duration: animationDuration,
                      curve: Curves.easeInOutQuad,
                      builder: (context, value, child) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: value,
                            sigmaY: value,
                          ),
                          child: TvOverscan(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colors.surface.withValues(
                                    alpha: overlayBackgroundOpacity),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: playlistState.loading
                                              // child: true
                                              ? TvButton(
                                                  onFocusChanged:
                                                      cubit.setShowImage,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: SizedBox(
                                                      width: 60,
                                                      height: 60,
                                                      child:
                                                          TweenAnimationBuilder(
                                                        tween: Tween<double>(
                                                            begin: 0,
                                                            end: playlistState
                                                                .loadingProgress),
                                                        duration:
                                                            animationDuration,
                                                        curve: Curves
                                                            .easeInOutQuad,
                                                        builder: (context,
                                                                value, child) =>
                                                            CircularProgressIndicator(
                                                          value: value > 0 &&
                                                                  value < 1
                                                              ? value
                                                              : null,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : TvButton(
                                                  autofocus: true,
                                                  onFocusChanged: (focus) {
                                                    cubit.setShowImage(focus);
                                                  },
                                                  onPressed: (context) =>
                                                      playPlaylist(context,
                                                          playlistState),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      size: 50,
                                                    ),
                                                  ),
                                                ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              playlistState.playlist.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: textTheme.headlineLarge,
                                            ),
                                            Text(
                                              locals.nVideos(playlistState
                                                  .playlist.videos.length),
                                              style: textTheme.bodyLarge,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    if (!playlistState.loading)
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
                                          child: GridView.count(
                                            controller: cubit.scrollController,
                                            childAspectRatio: 16 / 13,
                                            crossAxisCount: 3,
                                            children: [
                                              ...playlistState.playlist.videos
                                                  .where((element) =>
                                                      !element.filterHide)
                                                  .map((e) => TvVideoItem(
                                                      video: e,
                                                      autoFocus: false)),
                                              if (playlistState.loading)
                                                ...repeatWidget(
                                                    () =>
                                                        const TvVideoItemPlaceHolder(),
                                                    count: 10)
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

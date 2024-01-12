import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:invidious/notifications/views/components/bell_icon.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/playlists/views/components/playlist_thumbnail.dart';
import 'package:invidious/router.dart';
import 'package:invidious/settings/models/errors/invidious_service_error.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:invidious/videos/views/components/compact_video.dart';

import '../../../globals.dart';
import '../../../videos/views/components/add_to_queue_button.dart';
import '../../../videos/views/components/play_button.dart';
import '../../models/playlist.dart';
import '../../states/playlist.dart';

@RoutePage()
class PlaylistViewScreen extends StatelessWidget {
  final Playlist playlist;
  final bool canDeleteVideos;

  const PlaylistViewScreen(
      {super.key, required this.playlist, required this.canDeleteVideos});

  deletePlayList(BuildContext context) {
    var cubit = context.read<PlaylistCubit>();
    var locals = AppLocalizations.of(context)!;
    okCancelDialog(context, locals.deletePlayListQ, locals.irreversibleAction,
        () async {
      await cubit.deletePlaylist();

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  openVideo(BuildContext context, String videoId) {
    AutoRouter.of(context).push(VideoRoute(videoId: videoId));
  }

  removeVideoFromPlayList(BuildContext context, VideoInList v) async {
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<PlaylistCubit>();
    try {
      bool goBack = await cubit.removeVideoFromPlayList(v);

      if (context.mounted && goBack) {
        Navigator.of(context).pop();
      }
    } catch (err) {
      if (err is InvidiousServiceError && context.mounted) {
        showAlertDialog(context, locals.error, [Text(err.message)]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    var player = context.read<PlayerCubit>();
    return BlocProvider(
      create: (context) => PlaylistCubit(
          PlaylistState(playlist: playlist, playlistItemHeight: 100), player),
      child: BlocBuilder<PlaylistCubit, PlaylistState>(
        builder: (context, playlistState) {
          var cubit = context.read<PlaylistCubit>();
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  playlistState.playlist.title,
                ),
                actions: [
                  canDeleteVideos
                      ? InkWell(
                          onTap: () => deletePlayList(context),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete,
                              color: colors.secondary,
                            ),
                          ),
                        )
                      : BellIcon(
                          itemId: playlist.playlistId,
                          type: BellIconType.playlist)
                ],
              ),
              backgroundColor: colors.background,
              body: SafeArea(
                  bottom: false,
                  child: playlistState.loading ||
                          playlistState.playlist.videos.isNotEmpty
                      ? Center(
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: tabletMaxVideoWidth),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 250,
                                            child: PlaylistThumbnails(
                                              videos:
                                                  playlistState.playlist.videos,
                                              bestThumbnails: true,
                                              children: playlistState.loading
                                                  ? [
                                                      Center(
                                                          child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: colors
                                                                    .background
                                                                    .withOpacity(
                                                                        0.5),
                                                                shape: BoxShape
                                                                    .circle),
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
                                                                  value,
                                                                  child) =>
                                                              CircularProgressIndicator(
                                                            value: value > 0 &&
                                                                    value < 1
                                                                ? value
                                                                : null,
                                                          ),
                                                        ),
                                                      ))
                                                    ]
                                                  : [
                                                      PlayButton(
                                                        onPressed: (isAudio) =>
                                                            cubit.play(isAudio),
                                                      ),
                                                      Builder(
                                                          builder: (context) {
                                                        return Positioned(
                                                            right: 5,
                                                            bottom: 3,
                                                            child:
                                                                AddToQueueButton(
                                                              videos:
                                                                  playlistState
                                                                      .playlist
                                                                      .videos,
                                                            ));
                                                      })
                                                    ],
                                            ),
                                          )
                                        ])),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: innerHorizontalPadding),
                                  child: ListView(
                                    controller: cubit.scrollController,
                                    children: [
                                      ...playlistState.playlist.videos
                                          .where(
                                              (element) => !element.filterHide)
                                          .map((v) => SwipeActionCell(
                                              key: ValueKey(
                                                  'swipe-${v.videoId}'),
                                              trailingActions: canDeleteVideos
                                                  ? [
                                                      SwipeAction(
                                                        icon: const Icon(
                                                            Icons.delete,
                                                            color:
                                                                Colors.white),
                                                        performsFirstActionWithFullSwipe:
                                                            true,
                                                        onTap: (handler) async {
                                                          await handler(true);
                                                          if (context.mounted) {
                                                            removeVideoFromPlayList(
                                                                context, v);
                                                          }
                                                        },
                                                      )
                                                    ]
                                                  : null,
                                              child: CompactVideo(
                                                video: v,
                                                onTap: () => openVideo(
                                                    context, v.videoId),
                                                key: ValueKey(v.videoId),
                                              ))),
                                      if (playlistState.loading)
                                        ...repeatWidget(
                                            () =>
                                                const CompactVideoPlaceHolder(),
                                            count: 5)
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: Text(locals.noVideoInPlayList))));
        },
      ),
    );
  }
}

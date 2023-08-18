import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/main.dart';
import 'package:invidious/settings/models/errors/invidiousServiceError.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/playlists/views/components/playlist_thumbnail.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/videos/models/video_in_list.dart';
import 'package:invidious/videos/views/screens/video.dart';
import 'package:invidious/videos/views/components/compact_video.dart';
import 'package:invidious/utils/views/components/placeholders.dart';

import '../../states/playlist.dart';
import '../../../globals.dart';
import '../../models/playlist.dart';
import '../../../videos/views/components/add_to_queue_button.dart';
import '../../../videos/views/components/play_button.dart';

class PlaylistView extends StatelessWidget {
  final Playlist playlist;
  final bool canDeleteVideos;

  const PlaylistView({super.key, required this.playlist, required this.canDeleteVideos});

  deletePlayList(BuildContext context) {
    var cubit = context.read<PlaylistCubit>();
    var locals = AppLocalizations.of(context)!;
    okCancelDialog(context, locals.deletePlayListQ, locals.irreversibleAction, () async {
      await cubit.deletePlaylist();

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

  removeVideoFromPlayList(BuildContext context, VideoInList v) async {
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<PlaylistCubit>();
    try {
      bool goBack = await cubit.removeVideoFromPlayList(v);

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
    var player = context.read<MiniPlayerCubit>();
    return BlocProvider(
      create: (context) => PlaylistCubit(PlaylistState(playlist: playlist, playlistItemHeight: 100), player),
      child: BlocBuilder<PlaylistCubit, PlaylistState>(
        builder: (context, _) {
          var cubit = context.read<PlaylistCubit>();
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
                          onTap: () => deletePlayList(context),
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
                  child: _.loading || _.playlist.videos.isNotEmpty
                      ? Center(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: tabletMaxVideoWidth),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      SizedBox(
                                        height: 250,
                                        child: PlaylistThumbnails(
                                          videos: _.playlist.videos,
                                          bestThumbnails: true,
                                          children: _.loading
                                              ? [
                                                  Center(
                                                      child: TweenAnimationBuilder(
                                                    tween: Tween<double>(begin: 0, end: _.loadingProgress),
                                                    duration: animationDuration,
                                                    curve: Curves.easeInOutQuad,
                                                    builder: (context, value, child) => CircularProgressIndicator(
                                                      value: value > 0 && value < 1 ? value : null,
                                                    ),
                                                  ))
                                                ]
                                              : [
                                                  PlayButton(
                                                    onPressed: (isAudio) => cubit.play(isAudio),
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
                                    ])),
                                Expanded(
                                    child: ListView(
                                  controller: _.scrollController,
                                  children: [
                                    ..._.playlist.videos
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
                                                        removeVideoFromPlayList(context, v);
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
                                    if (_.loading) ...repeatWidget(() => const CompactVideoPlaceHolder(), count: 5)
                                  ],
                                ))
                              ],
                            ),
                          ),
                        )
                      : Container(alignment: Alignment.center, child: Text(locals.noVideoInPlayList))));
        },
      ),
    );
  }
}

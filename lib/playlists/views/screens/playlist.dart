import 'package:auto_route/auto_route.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/notifications/views/components/bell_icon.dart';
import 'package:clipious/player/states/player.dart';
import 'package:clipious/playlists/views/components/playlist_inner_view.dart';
import 'package:clipious/playlists/views/tablet/playlist_inner_view.dart';
import 'package:clipious/router.dart';
import 'package:clipious/settings/models/errors/invidious_service_error.dart';
import 'package:clipious/utils.dart';

import '../../../utils/views/components/device_widget.dart';
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
    AutoRouter.of(context).push(VideoRoute(videoId: videoId)).then((value) {
      context
          .read<PlaylistCubit>()
          .refreshPlaylist(userPlaylist: canDeleteVideos);
    });
  }

  removeVideoFromPlayList(BuildContext context, Video v) async {
    if (canDeleteVideos) {
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
              backgroundColor: colors.surface,
              body: SafeArea(
                  bottom: false,
                  child: playlistState.loading ||
                          playlistState.playlist.videos.isNotEmpty
                      ? DeviceWidget(
                          phone: PlaylistInnerView(
                            canDeleteVideos: canDeleteVideos,
                            openVideo: openVideo,
                            removeVideoFromPlaylist: removeVideoFromPlayList,
                          ),
                          tablet: TabletPlaylistInnerView(
                            canDeleteVideos: canDeleteVideos,
                            openVideo: openVideo,
                            removeVideoFromPlaylist: removeVideoFromPlayList,
                          ))
                      : Container(
                          alignment: Alignment.center,
                          child: Text(locals.noVideoInPlayList))));
        },
      ),
    );
  }
}

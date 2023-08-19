import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/videos/states/add_to_playlist.dart';
import 'package:invidious/videos/states/add_to_playlist_button.dart';
import 'package:invidious/videos/states/video_like.dart';
import 'package:logging/logging.dart';

import '../../../playlists/views/components/add_to_playlist_list.dart';
import '../../../settings/views/screens/manage_single_server.dart';

final log = Logger('AddToPlaylistView');

class AddToPlaylist extends StatelessWidget {
  final String videoId;
  final VideoLikeButtonCubit? videoLikeButtonCubit;
  final AddToPlaylistButtonCubit? addToPlaylistButtonCubit;

  const AddToPlaylist({super.key, required this.videoId, this.videoLikeButtonCubit, this.addToPlaylistButtonCubit});

  static showAddToPlaylistDialog(BuildContext context, String videoId) {
    VideoLikeButtonCubit? likeButtonCubit;
    AddToPlaylistButtonCubit? playlistButtonCubit;
    try {
      likeButtonCubit = context.read<VideoLikeButtonCubit>();
      playlistButtonCubit = context.read<AddToPlaylistButtonCubit>();
    } catch (err) {
      log.fine('We can\'t fine the providers but it\'s probably ok');
    }
    showModalBottomSheet<void>(
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return AddToPlaylist(
            videoId: videoId,
            videoLikeButtonCubit: likeButtonCubit,
            addToPlaylistButtonCubit: playlistButtonCubit,
          );
        });
  }

  addToPlaylist(BuildContext context, String playlistId, AddToPlaylistCubit cubit) async {
    var locals = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await cubit.addToPlaylist(playlistId);
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(locals.videoAddedToPlaylist),
        duration: const Duration(seconds: 3),
      ));
    } catch (err) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(locals.errorAddingVideoToPlaylist),
        duration: const Duration(seconds: 3),
      ));
      rethrow;
    }

    if (context.mounted) {
      navigatorKey.currentState?.pop();
    }
  }

  newPlaylistAndAdd(BuildContext context, AddToPlaylistController controller, AddToPlaylistCubit cubit) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: AddPlayListForm(afterAdd: (playlistId) => addToPlaylist(context, playlistId, cubit)),
            ));
  }

  openServerSettings(BuildContext context) {
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_SETTINGS_MANAGE_ONE_SERVER, builder: (context) => ManageSingleServer(server: db.getCurrentlySelectedServer())));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => AddToPlaylistCubit(AddToPlaylistController(videoId), videoLikeButtonCubit: videoLikeButtonCubit, addToPlaylistButtonCubit: addToPlaylistButtonCubit),
      child: BlocBuilder<AddToPlaylistCubit, AddToPlaylistController>(
        builder: (context, _) {
          var cubit = context.read<AddToPlaylistCubit>();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(locals.selectPlaylist),
              !_.isLoggedIn
                  ? Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(locals.notLoggedIn),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: FilledButton(onPressed: () => openServerSettings(context), child: Text(locals.logIn)),
                              )
                            ],
                          )))
                  : const SizedBox.shrink(),
              _.loading ? const Expanded(child: Align(alignment: Alignment.center, child: CircularProgressIndicator())) : const SizedBox.shrink(),
              Expanded(
                child: ListView(
                  children: _.playlists.map((p) {
                    bool inPlaylist = cubit.videoInPlaylist(p.playlistId);
                    return FilledButton.tonal(
                        onPressed: inPlaylist ? null : () => addToPlaylist(context, p.playlistId, cubit),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  width: 20,
                                  child: inPlaylist
                                      ? const Icon(
                                          Icons.check,
                                          size: 15,
                                        )
                                      : const SizedBox.shrink()),
                            ),
                            Expanded(child: Text(p.title)),
                          ],
                        ));
                  }).toList(),
                ),
              ),
              FilledButton.tonal(
                onPressed: _.isLoggedIn ? () => newPlaylistAndAdd(context, _, cubit) : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const Icon(Icons.add), Text(locals.createNewPlaylist)],
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/router.dart';
import 'package:logging/logging.dart';

import '../../../playlists/models/playlist.dart';
import '../../../playlists/views/components/add_to_playlist_list.dart';

final log = Logger('AddToPlaylistView');

class AddToPlaylistDialog extends StatelessWidget {
  final String videoId;
  final List<Playlist> playlists;
  final Function(String selectedPlaylistId) onAdd;

  const AddToPlaylistDialog({super.key, required this.videoId, required this.playlists, required this.onAdd});

  static showAddToPlaylistDialog(BuildContext context,
      {required String videoId,
      required List<Playlist> playlists,
      required Function(String selectedPlaylistId) onAdd}) {
    showModalBottomSheet<void>(
        showDragHandle: true,
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return AddToPlaylistDialog(
            videoId: videoId,
            playlists: playlists,
            onAdd: onAdd,
          );
        });
  }

  addToPlaylist(BuildContext context, String playlistId) async {
    var locals = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      onAdd(playlistId);
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(locals.videoAddedToPlaylist),
        duration: const Duration(seconds: 3),
      ));

      if (context.mounted) {
        Navigator.pop(context);
      }
    } catch (err) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(locals.errorAddingVideoToPlaylist),
        duration: const Duration(seconds: 3),
      ));
      rethrow;
    }

  }

  newPlaylistAndAdd(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext ctx) => Dialog(
              child: AddPlayListForm(afterAdd: (playlistId) => addToPlaylist(context, playlistId)),
            ));
  }

  openServerSettings(BuildContext context) {
    AutoRouter.of(context).push(ManageSingleServerRoute(server: db.getCurrentlySelectedServer()));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var app = context.read<AppCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(locals.selectPlaylist),
        !app.isLoggedIn
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
            : Expanded(
                child: ListView(
                  children: playlists.map((p) {
                    bool inPlaylist = p.videos.any((element) => element.videoId == videoId);
                    return FilledButton.tonal(
                        onPressed: inPlaylist ? null : () => addToPlaylist(context, p.playlistId),
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
          onPressed: app.isLoggedIn ? () => newPlaylistAndAdd(context) : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Icon(Icons.add), Text(locals.createNewPlaylist)],
          ),
        )
      ]),
    );
  }
}

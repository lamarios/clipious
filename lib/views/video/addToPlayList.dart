import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/addToPlaylistController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/myRouteObserver.dart';

import '../playlists.dart';
import '../../settings/views/screens/manage_single_server.dart';

class AddToPlaylist extends StatelessWidget {
  final String videoId;

  const AddToPlaylist({super.key, required this.videoId});

  static showAddToPlaylistDialog(BuildContext context, String videoId) {
    showModalBottomSheet<void>(
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return AddToPlaylist(videoId: videoId);
        });
  }

  addToPlaylist(BuildContext context, AddToPlaylistController controller, String playlistId) async {
    var locals = AppLocalizations.of(context)!;
    Navigator.of(context).pop();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await controller.addToPlaylist(playlistId);
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
  }

  newPlaylistAndAdd(BuildContext context, AddToPlaylistController controller) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: AddPlayListForm(afterAdd: (context, playlistId) => addToPlaylist(context, controller, playlistId)),
            ));
  }

  openServerSettings(BuildContext context) {
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_SETTINGS_MANAGE_ONE_SERVER, builder: (context) => ManageSingleServer(server: db.getCurrentlySelectedServer())));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;

    return GetBuilder<AddToPlaylistController>(
      init: AddToPlaylistController(videoId),
      global: false,
      builder: (_) => Padding(
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
                bool inPlaylist = _.videoInPlaylist(p.playlistId);
                return FilledButton.tonal(
                    onPressed: inPlaylist ? null : () => addToPlaylist(context, _, p.playlistId),
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
            onPressed: _.isLoggedIn ? () => newPlaylistAndAdd(context, _) : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Icon(Icons.add), Text(locals.createNewPlaylist)],
            ),
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/addToPlaylistController.dart';

import '../playlists.dart';

class AddToPlaylist extends StatelessWidget {
  final String videoId;

  const AddToPlaylist({super.key, required this.videoId});

  static showAddToPlaylistDialog(BuildContext context, String videoId) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return AddToPlaylist(videoId: videoId);
        });
  }

  addToPlaylist(BuildContext context, String playlistId) async {
    var locals = AppLocalizations.of(context)!;
    Navigator.of(context).pop();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await Get.find<AddToPlaylistController>().addToPlaylist(playlistId, videoId);
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

  newPlaylistAndAdd(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: AddPlayListForm(afterAdd: addToPlaylist),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;

    return GetBuilder<AddToPlaylistController>(
      init: AddToPlaylistController(),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: const BoxConstraints(minHeight: 400),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(locals.selectPlaylist),
            _.loading ? const CircularProgressIndicator() : const SizedBox.shrink(),
            Expanded(
              child: ListView(
                children: _.playlists.map((p) => FilledButton.tonal(onPressed: () => addToPlaylist(context, p.playlistId), child: Text(p.title))).toList(),
              ),
            ),
            FilledButton.tonal(
              onPressed: () => newPlaylistAndAdd(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Icon(Icons.add), Text(locals.createNewPlaylist)],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

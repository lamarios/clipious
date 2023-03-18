import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/playlistController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/views/playlistList.dart';
import 'package:invidious/views/playlists/playlist.dart';
import 'package:logging/logging.dart';

import '../main.dart';
import '../models/playlist.dart';
import '../utils.dart';

const PLAYLIST_ADDED = 'playlist-added';

class Playlists extends StatefulWidget {
  final bool canDeleteVideos;

  const Playlists({super.key, required this.canDeleteVideos});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> with RouteAware {
  final log = Logger('Playlists');

  @override
  void initState() {
    super.initState();
    FBroadcast.instance().register(PLAYLIST_ADDED, (value, callback) {
      // playlistKey.currentState?.refreshPlaylists();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    // playlistKey.currentState?.refreshPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: PlaylistList(
          canDeleteVideos: widget.canDeleteVideos,
          paginatedList: SingleEndpointList(service.getUserPlaylists),
        ))
      ],
    );
  }
}

class AddPlayListButton extends StatefulWidget {
  AddPlayListButton({super.key});

  @override
  State<AddPlayListButton> createState() => _AddPlayListButtonState();
}

class _AddPlayListButtonState extends State<AddPlayListButton> {
  addPlaylistDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: AddPlayListForm(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return FloatingActionButton(
      onPressed: () => addPlaylistDialog(context),
      backgroundColor: colors.primaryContainer,
      child: const Icon(Icons.add),
    );
  }
}

class AddPlayListForm extends StatefulWidget {
  Function(BuildContext context, String playlistId)? afterAdd;

  AddPlayListForm({super.key, this.afterAdd});

  @override
  State<AddPlayListForm> createState() => _AddPlayListFormState();
}

class _AddPlayListFormState extends State<AddPlayListForm> {
  final TextEditingController nameController = TextEditingController(text: '');
  String privacyValue = 'public';

  addPlaylist(BuildContext context) async {
    var locals = AppLocalizations.of(context)!;
    try {
      String? playlistId = await service.createPlayList(nameController.value.text, privacyValue);

      Get.find<PlaylistController>().refreshPlaylists();

      if (context.mounted && widget.afterAdd != null) {
        widget.afterAdd!(context, playlistId!);
      }
      Navigator.of(context).pop();
    } catch (err) {
      showAlertDialog(context, locals.error, [Text(err.toString())]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return SizedBox(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locals.addPlayList),
            TextField(
              decoration: InputDecoration(hintText: locals.playListName),
              controller: nameController,
              autocorrect: false,
              enableSuggestions: false,
              enableIMEPersonalizedLearning: false,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('${locals.playlistVisibility}:'),
                  ),
                  DropdownButton(
                    value: privacyValue,
                    items: [
                      DropdownMenuItem(value: 'public', child: Text(locals.publicPlaylist)),
                      DropdownMenuItem(value: 'unlisted', child: Text(locals.unlistedPlaylist)),
                      DropdownMenuItem(value: 'private', child: Text(locals.privatePlaylist))
                    ],
                    onChanged: (value) {
                      setState(() {
                        privacyValue = value ?? '';
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(locals.cancel),
                ),
                TextButton(
                  onPressed: () {
                    addPlaylist(context);
                  },
                  child: Text(locals.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

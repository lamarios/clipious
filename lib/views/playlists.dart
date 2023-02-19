import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
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

class _PlaylistsState extends State<Playlists> with AfterLayoutMixin<Playlists>, RouteAware {
  final log = Logger('Playlists');
  List<Playlist> playlists = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    FBroadcast.instance().register(PLAYLIST_ADDED, (value, callback) {
      getPlayLists();
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
    getPlayLists();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(visible: loading, child: LinearProgressIndicator()),
        Expanded(
          child: ListView(
            children: playlists
                .map((p) => PlaylistItem(
                      key: ValueKey(p.playlistId),
                      playlist: p,
                      canDeleteVideos: widget.canDeleteVideos,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }

  getPlayLists() async {
    setState(() {
      loading = true;
    });
    List<Playlist> lists = await service.getUserPlaylists();
    if (mounted) {
      setState(() {
        playlists = lists;
        loading = false;
      });
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    getPlayLists();
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
    try {
      String? playlistId = await service.createPlayList(nameController.value.text, privacyValue);
      FBroadcast.instance().broadcast(PLAYLIST_ADDED);


      if (context.mounted && widget.afterAdd != null) {
        widget.afterAdd!(context, playlistId!);
      }
      Navigator.of(context).pop();
    } catch (err) {
      showAlertDialog(context, 'Error', [Text(err.toString())]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Add Playlist'),
            TextField(
              decoration: InputDecoration(hintText: 'Playlist name'),
              controller: nameController,
              autocorrect: false,
              enableSuggestions: false,
              enableIMEPersonalizedLearning: false,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Visibility:'),
                  ),
                  DropdownButton(
                    value: privacyValue,
                    items: const [
                      DropdownMenuItem(value: 'public', child: Text('Public')),
                      DropdownMenuItem(value: 'unlisted', child: Text('Unlisted')),
                      DropdownMenuItem(value: 'private', child: Text('Private'))
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
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    addPlaylist(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/playlists/playlist.dart';

import '../models/playlist.dart';
import '../utils.dart';

const PLAYLIST_ADDED = 'playlist-added';

class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> with AfterLayoutMixin<Playlists> {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(visible: loading, child: LinearProgressIndicator()),
        Expanded(
          child: ListView(
            children: playlists.map((p) => PlaylistItem(key: ValueKey(p.playlistId), playlist: p)).toList(),
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
    print(lists.length);
    setState(() {
      playlists = lists;
      loading = false;
    });
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
        builder: (BuildContext context) => const Dialog(
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
  const AddPlayListForm({super.key});

  @override
  State<AddPlayListForm> createState() => _AddPlayListFormState();
}

class _AddPlayListFormState extends State<AddPlayListForm> {
  final TextEditingController nameController = TextEditingController(text: '');
  String privacyValue = 'public';

  addPlaylist(BuildContext context) async {
    try {
      await service.createPlayList(nameController.value.text, privacyValue);
      FBroadcast.instance().broadcast(PLAYLIST_ADDED);
      Navigator.of(context).pop();
    } catch (err) {
      showAlertDialog(context, [Text(err.toString())]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Add Playlist'),
          TextField(
            controller: nameController,
            autocorrect: false,
            enableSuggestions: false,
            enableIMEPersonalizedLearning: false,
          ),
          DropdownButton(
            value: privacyValue,
            items: const [
              DropdownMenuItem(value: 'public', child: Text('Public')),
              DropdownMenuItem(value: 'unlisted', child: Text('Unlisted')),
              DropdownMenuItem(value: 'private', child: Text('Private'))
            ],
            onChanged: (value) {
              print(value);
              setState(() {
                privacyValue = value ?? '';
              });
            },
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
    );
  }
}

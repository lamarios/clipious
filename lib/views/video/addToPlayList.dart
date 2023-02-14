import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';

import '../../models/playlist.dart';
import '../playlists.dart';

class AddToPlaylist extends StatefulWidget {
  final String videoId;

  const AddToPlaylist({super.key, required this.videoId});

  static showDialog(BuildContext context, String videoId) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return AddToPlaylist(videoId: videoId);
        });
  }

  @override
  State<AddToPlaylist> createState() => _AddToPlaylistState();
}

class _AddToPlaylistState extends State<AddToPlaylist> with AfterLayoutMixin<AddToPlaylist> {
  List<Playlist> playlists = [];

  bool loading = true;

  addToPlaylist(BuildContext context, String playlistId) async {
    Navigator.of(context).pop();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await service.addVideoToPlaylist(playlistId, widget.videoId);
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Video added to playlist.'),
        duration: Duration(seconds: 3),
      ));
    } catch (err) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Error while adding video to playlist'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  newPlaylistAndAdd(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) =>  Dialog(
          child: AddPlayListForm(afterAdd: addToPlaylist),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(minHeight: 400),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Select playlist'),
          loading ? CircularProgressIndicator() : SizedBox.shrink(),
          Expanded(
            child: ListView(
              children: playlists.map((p) => FilledButton.tonal(onPressed: () => addToPlaylist(context, p.playlistId), child: Text(p.title))).toList(),
            ),
          ),
          FilledButton.tonal(
            onPressed: () => newPlaylistAndAdd(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Icon(Icons.add), Text('Create new playlist')],
            ),
          )
        ]),
      ),
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    List<Playlist> pl = await service.getUserPlaylists();
    setState(() {
      loading = false;
      playlists = pl;
    });
  }
}

import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/playlists/playlist.dart';

import '../../models/channelPlaylists.dart';
import '../../models/playlist.dart';

class ChannelPlayListsView extends StatefulWidget {
  final String channelId;

  const ChannelPlayListsView({
    super.key,
    required this.channelId,
  });

  @override
  State<ChannelPlayListsView> createState() => _ChannelPlayListsViewState();
}

class _ChannelPlayListsViewState extends State<ChannelPlayListsView> with AfterLayoutMixin<ChannelPlayListsView> {
  bool loading = true;
  List<Playlist> playlists = [];
  String? continuation;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.addAll(playlists.map((e) => PlaylistItem(playlist: e)).toList());

    if (loading) {
      widgets.add(
        CircularProgressIndicator(),
      );
    }

    return Column(
      children: widgets,
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    ChannelPlaylists channelLists = await service.getChannelPlaylists(widget.channelId, continuation);
    setState(() {
      loading = false;
      playlists = channelLists.playlists;
      continuation = channelLists.continuation;
    });
  }
}

import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/service.dart';
import 'package:invidious/views/playlistList.dart';
import 'package:invidious/views/playlists/playlist.dart';

import '../../models/channelPlaylists.dart';
import '../../models/playlist.dart';

class ChannelPlayListsView extends StatefulWidget {
  final String channelId;
  final bool canDeleteVideos;

  const ChannelPlayListsView({
    super.key,
    required this.channelId,
    required this.canDeleteVideos,
  });

  @override
  State<ChannelPlayListsView> createState() => _ChannelPlayListsViewState();
}

class _ChannelPlayListsViewState extends State<ChannelPlayListsView> {
  String? continuation;

  @override
  Widget build(BuildContext context) {
    return PlaylistList(
      key: const ValueKey('playlysts'),
      canDeleteVideos: widget.canDeleteVideos,
      paginatedList: ContinuationList<Playlist>((continuation) => service.getChannelPlaylists(widget.channelId, continuation: continuation)),
    );
  }

  Future<List<Playlist>> refresh() async {
    setState(() {
      continuation = null;
    });

    return getPlaylists();
  }

  Future<List<Playlist>> getPlaylists() async {
    ChannelPlaylists channelLists = await service.getChannelPlaylists(widget.channelId, continuation: continuation);

    setState(() {
      continuation = channelLists.continuation;
      print('CONTINUATION ${continuation}');
    });

    return channelLists.playlists;
  }
}

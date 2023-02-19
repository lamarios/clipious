import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
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

class _ChannelPlayListsViewState extends State<ChannelPlayListsView> with AfterLayoutMixin<ChannelPlayListsView> {
  bool loading = true;
  List<Playlist> playlists = [];
  String? continuation;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  onScroll() {
    if (scrollController.hasClients) {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        getPlaylists();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.addAll(playlists
        .map((e) => PlaylistItem(
              playlist: e,
              canDeleteVideos: widget.canDeleteVideos,
            ))
        .toList());

    if (loading) {
      widgets.add(
        const Center(child: CircularProgressIndicator()),
      );
    }

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: widgets,
      ),
    );
  }

  getPlaylists() async {
    ChannelPlaylists channelLists = await service.getChannelPlaylists(widget.channelId, continuation);

    List<Playlist> pl = playlists;
    pl.addAll(channelLists.playlists);
    setState(() {
      loading = false;
      playlists = pl;
      continuation = channelLists.continuation;
    });
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    getPlaylists();
  }
}

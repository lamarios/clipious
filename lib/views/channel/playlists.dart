import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/views/playlistList.dart';

import '../../models/playlist.dart';

class ChannelPlayListsView extends StatelessWidget {
  final String channelId;
  final bool canDeleteVideos;

  const ChannelPlayListsView({
    super.key,
    required this.channelId,
    required this.canDeleteVideos,
  });

  @override
  Widget build(BuildContext context) {
    return PlaylistList(
      canDeleteVideos: canDeleteVideos,
      paginatedList: ContinuationList<Playlist>((continuation) => service.getChannelPlaylists(channelId, continuation: continuation)),
      tag: 'channel-$channelId',
    );
  }
}

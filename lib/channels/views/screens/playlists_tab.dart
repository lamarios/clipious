import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:clipious/channels/views/components/playlists.dart';

@RoutePage()
class ChannelPlaylistsTab extends StatelessWidget {
  final String? channelId;

  const ChannelPlaylistsTab({super.key, this.channelId});

  @override
  Widget build(BuildContext context) {
    return channelId == null
        ? const SizedBox.shrink()
        : ChannelPlayListsView(
            channelId: channelId!,
            canDeleteVideos: false,
          );
  }
}

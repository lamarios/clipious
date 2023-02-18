// import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/objectbox.g.dart';
import 'package:invidious/views/channel/info.dart';
import 'package:invidious/views/channel/playlists.dart';
import 'package:invidious/views/channel/videos.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video/comments.dart';
import 'package:invidious/views/video/info.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import '../models/channel.dart';
import '../models/sponsorSegment.dart';
import '../models/video.dart';
import '../utils.dart';
import 'components/subscribeButton.dart';

class ChannelView extends StatefulWidget {
  final String channelId;

  const ChannelView({super.key, required this.channelId});

  @override
  State<ChannelView> createState() => ChannelViewState();
}

class ChannelViewState extends State<ChannelView> with AfterLayoutMixin<ChannelView> {
  bool isSubscribed = false;
  int selectedIndex = 0;
  Channel? channel;
  bool loading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() async {
    super.dispose();
  }


  toggleSubscription() async {
    if (this.isSubscribed) {
      await service.unSubscribe(widget.channelId);
    } else {
      await service.subscribe(widget.channelId);
    }
    bool isSubscribed = await service.isSubscribedToChannel(widget.channelId);
    setState(() {
      this.isSubscribed = isSubscribed;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorScheme.background.withOpacity(0.4),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          channel?.author ?? '',
        ),
        actions: [
          Visibility(
            visible: channel != null,
            child: GestureDetector(
              onTap: () => showSharingSheet(context, channel!),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.share,
                  color: colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: colorScheme.background,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        elevation: 0,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.info), label: 'Info'),
          NavigationDestination(icon: Icon(Icons.play_arrow), label: 'Videos'),
          NavigationDestination(icon: Icon(Icons.stream), label: 'Streams'),
          NavigationDestination(icon: Icon(Icons.playlist_play), label: 'Playlists')
        ],
      ),
      body: SafeArea(
        top: false,
          bottom: false,
          child: AnimatedSwitcher(
            duration: animationDuration,
            child: loading
                ? Container(alignment: Alignment.center, child: const CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Thumbnail(
                          width: double.infinity,
                          height: 250,
                          thumbnailUrl: ImageObject.getBestThumbnail(channel!.authorThumbnails)?.url ?? '',
                          id: 'channel-banner/${widget.channelId}',
                          decoration: BoxDecoration(color: colorScheme.secondaryContainer,)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SubscribeButton(channelId: channel!.authorId, subCount: compactCurrency.format(channel!.subCount)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: <Widget>[
                          ChannelInfo(key: const ValueKey('info'),channel: channel!),
                          ChannelVideosView(key: const ValueKey('videos'), channel: channel!, getVideos: service.getChannelVideos,),
                          ChannelVideosView(key: const ValueKey('streams'),channel: channel!, getVideos: service.getChannelStreams,),
                          ChannelPlayListsView(key: const ValueKey('playlists'),channelId: channel!.authorId, canDeleteVideos: false)
                        ][selectedIndex],
                      )
                    ],
                  ),
          )),
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    bool isSubscribed = await service.isSubscribedToChannel(widget.channelId);
    Channel channel = await service.getChannel(widget.channelId);

    setState(() {
      this.channel = channel;
      loading = false;
      this.isSubscribed = isSubscribed;
    });
  }
}

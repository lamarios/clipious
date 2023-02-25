// import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/views/channel/info.dart';
import 'package:invidious/views/channel/playlists.dart';
import 'package:invidious/views/channel/videos.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:logging/logging.dart';

import '../models/channel.dart';
import '../utils.dart';
import 'components/subscribeButton.dart';

double minBarHeight = AppBar().preferredSize.height;

class ChannelView extends StatefulWidget {
  final String channelId;

  const ChannelView({super.key, required this.channelId});

  @override
  State<ChannelView> createState() => ChannelViewState();
}

class ChannelViewState extends State<ChannelView> with AfterLayoutMixin<ChannelView>, SingleTickerProviderStateMixin {
  var log = Logger('ChannelView');
  bool isSubscribed = false;
  int selectedIndex = 0;
  Channel? channel;
  bool loading = true;
  bool smallHeader = false;
  double barHeight = 200;
  double barOpacity = 1;

  Animation<Color?>? animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: animationDuration, vsync: this);
  }

  @override
  dispose() async {
    controller.dispose();
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

  bool onBodyScroll(ScrollNotification notification) {
    double height = 200 - min(notification.metrics.pixels, 200);
    double opacity = min(1, height / 200);
    height = max(minBarHeight, height);
    setState(() {
      barOpacity = opacity;
      barHeight = height;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    // double? headerHeight = smallHeader ? null : 250;
    var barItemOpacity = 1 - barOpacity;
    Color barItemColors = (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withOpacity(barItemOpacity);

    var appbar = AppBar(
      backgroundColor: animation?.value ?? colorScheme.background.withOpacity(0.4),
      elevation: 0,
      flexibleSpace: Opacity(
        opacity: barOpacity,
        child: channel != null
            ? Thumbnail(
                width: double.infinity,
                height: 250,
                thumbnailUrl: ImageObject.getBestThumbnail(channel!.authorThumbnails)?.url ?? '',
                id: 'channel-banner/${widget.channelId}',
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                ))
            : null,
      ),
      scrolledUnderElevation: 0,
      toolbarHeight: barHeight,
      iconTheme: IconThemeData(color: barItemColors),
      title: Text(
        channel?.author ?? '',
        style: TextStyle(color: barItemColors),
      ),
      actions: loading
          ? []
          : [
              Visibility(
                visible: channel != null,
                child: IconButton(
                  onPressed: () => showSharingSheet(context, channel!),
                  icon: const Icon(Icons.share),
                  color: colorScheme.secondary.withOpacity(barItemOpacity),
                ),
              ),
            ],
    );


    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: appbar,
      backgroundColor: colorScheme.background,
      bottomNavigationBar: loading
          ? null
          : NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              elevation: 0,
              onDestinationSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedIndex: selectedIndex,
              destinations: <Widget>[
                NavigationDestination(icon: Icon(Icons.info), label: locals.info),
                NavigationDestination(icon: Icon(Icons.play_arrow), label: locals.videos),
                NavigationDestination(icon: Icon(Icons.stream), label: locals.streams),
                NavigationDestination(icon: Icon(Icons.playlist_play), label: locals.playlists)
              ],
            ),
      body: SafeArea(
          top: false,
          bottom: false,
          child: NotificationListener<ScrollNotification>(
            onNotification: onBodyScroll,
            child: AnimatedSwitcher(
              duration: animationDuration,
              child: loading
                  ? Container(alignment: Alignment.center, child: const CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            ChannelInfo(key: const ValueKey('info'), channel: channel!),
                            ChannelVideosView(
                              key: const ValueKey('videos'),
                              channel: channel!,
                              getVideos: service.getChannelVideos,
                            ),
                            ChannelVideosView(
                              key: const ValueKey('streams'),
                              channel: channel!,
                              getVideos: service.getChannelStreams,
                            ),
                            ChannelPlayListsView(key: const ValueKey('playlists'), channelId: channel!.authorId, canDeleteVideos: false)
                          ][selectedIndex],
                        )
                      ],
                    ),
            ),
          )),
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    ColorScheme colors = Theme.of(context).colorScheme;
    animation = ColorTween(begin: colors.background.withOpacity(0.4), end: colors.background).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });

    bool isSubscribed = await service.isSubscribedToChannel(widget.channelId);
    Channel channel = await service.getChannel(widget.channelId);

    setState(() {
      this.channel = channel;
      loading = false;
      this.isSubscribed = isSubscribed;
    });
  }
}

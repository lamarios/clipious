// import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/channelController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/views/channel/info.dart';
import 'package:invidious/views/channel/playlists.dart';
import 'package:invidious/views/channel/videos.dart';
import 'package:invidious/views/components/miniPlayerAware.dart';
import 'package:invidious/views/components/videoThumbnail.dart';

import '../utils.dart';
import 'components/subscribeButton.dart';

double channelMinBarHeight = AppBar().preferredSize.height;

class ChannelView extends StatefulWidget {
  final String channelId;

  const ChannelView({super.key, required this.channelId});

  @override
  State<ChannelView> createState() => ChannelViewState();
}

class ChannelViewState extends State<ChannelView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    return GetBuilder<ChannelController>(
      global: false,
      init: ChannelController(widget.channelId, backgroundColor: colorScheme.background, vsync: this),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            _.channel?.author ?? '',
          ),
          actions: _.loading
              ? []
              : [
                  Visibility(
                    visible: _.channel != null,
                    child: IconButton(
                      onPressed: () => showSharingSheet(context, _.channel!),
                      icon: const Icon(Icons.share),
                    ),
                  ),
                ],
        ),
        backgroundColor: colorScheme.background,
        bottomNavigationBar: _.loading
            ? null
            : NavigationBar(
                backgroundColor: colorScheme.background,
                labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                elevation: 0,
                onDestinationSelected: _.selectIndex,
                selectedIndex: _.selectedIndex,
                destinations: <Widget>[
                  NavigationDestination(icon: const Icon(Icons.info), label: locals.info),
                  NavigationDestination(icon: const Icon(Icons.play_arrow), label: locals.videos),
                  NavigationDestination(icon: const Icon(Icons.videocam), label: locals.shorts),
                  NavigationDestination(icon: const Icon(Icons.stream), label: locals.streams),
                  NavigationDestination(icon: const Icon(Icons.playlist_play), label: locals.playlists)
                ],
              ),
        body: SafeArea(
            bottom: false,
            child: AnimatedSwitcher(
              duration: animationDuration,
              child: _.loading
                  ? Container(alignment: Alignment.center, child: const CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 170,
                          child: Stack(children: [
                            Thumbnail(
                                width: double.infinity,
                                thumbnailUrl: ImageObject.getBestThumbnail(_.channel!.authorThumbnails)?.url ?? '',
                                id: 'channel-banner/${widget.channelId}',
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Colors.transparent,
                                      Colors.transparent,
                                      Colors.transparent,
                                  colorScheme.background
                                ])
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, top: 128),
                                child: Text(_.channel?.author ?? '', style: TextStyle(fontSize: 30, color:  colorScheme.primary),),
                              ),
                            ))
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SubscribeButton(channelId: _.channel!.authorId, subCount: compactCurrency.format(_.channel!.subCount)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: <Widget>[
                            ChannelInfo(key: const ValueKey('info'), channel: _.channel!),
                            ChannelVideosView(
                              key: const ValueKey('videos'),
                              channel: _.channel!,
                              getVideos: service.getChannelVideos,
                            ),
                            ChannelVideosView(
                              key: const ValueKey('shorts'),
                              channel: _.channel!,
                              getVideos: service.getChannelShorts,
                            ),
                            ChannelVideosView(
                              key: const ValueKey('streams'),
                              channel: _.channel!,
                              getVideos: service.getChannelStreams,
                            ),
                            ChannelPlayListsView(key: const ValueKey('playlists'), channelId: _.channel!.authorId, canDeleteVideos: false)
                          ][_.selectedIndex],
                        )
                      ],
                    ),
            )),
      ),
    );
  }
}

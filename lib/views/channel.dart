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
  AppBar buildAppBar(BuildContext context, ChannelController controller) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var barItemOpacity = 1 - controller.barOpacity;
    Color barItemColors = (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withOpacity(barItemOpacity);

    return AppBar(
      backgroundColor: controller.animation?.value ?? colorScheme.background.withOpacity(0.4),
      elevation: 0,
      flexibleSpace: Opacity(
        opacity: controller.barOpacity,
        child: controller.channel != null
            ? Thumbnail(
                width: double.infinity,
                height: 250,
                thumbnailUrl: ImageObject.getBestThumbnail(controller.channel!.authorThumbnails)?.url ?? '',
                id: 'channel-banner/${widget.channelId}',
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                ))
            : null,
      ),
      scrolledUnderElevation: 0,
      toolbarHeight: controller.barHeight,
      iconTheme: IconThemeData(color: barItemColors),
      title: Text(
        controller.channel?.author ?? '',
        style: TextStyle(color: barItemColors),
      ),
      actions: controller.loading
          ? []
          : [
              Visibility(
                visible: controller.channel != null,
                child: IconButton(
                  onPressed: () => showSharingSheet(context, controller.channel!),
                  icon: const Icon(Icons.share),
                  color: colorScheme.secondary.withOpacity(barItemOpacity),
                ),
              ),
            ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    // double? headerHeight = smallHeader ? null : 250;

    return GetBuilder<ChannelController>(
      global: false,
      init: ChannelController(widget.channelId, colorScheme.background, this),
      builder: (_) => Scaffold(
        extendBodyBehindAppBar: false,
        appBar: buildAppBar(context, _),
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
                  NavigationDestination(icon: const Icon(Icons.stream), label: locals.streams),
                  NavigationDestination(icon: const Icon(Icons.playlist_play), label: locals.playlists)
                ],
              ),
        body: SafeArea(
            top: false,
            bottom: false,
            child: NotificationListener<ScrollNotification>(
              onNotification: _.onBodyScroll,
              child: AnimatedSwitcher(
                duration: animationDuration,
                child: _.loading
                    ? Container(alignment: Alignment.center, child: const CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                key: const ValueKey('streams'),
                                channel: _.channel!,
                                getVideos: service.getChannelStreams,
                              ),
                              ChannelPlayListsView(key: const ValueKey('playlists'), channelId: _.channel!.authorId, canDeleteVideos: false)
                            ][_.selectedIndex],
                          )
                        ],
                      ),
              ),
            )),
      ),
    );
  }
}

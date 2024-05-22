import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/channels/states/channel.dart';
import 'package:invidious/router.dart';

import '../../../utils.dart';

@RoutePage()
class ChannelScreen extends StatelessWidget {
  final String channelId;

  const ChannelScreen({super.key, @pathParam required this.channelId});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    return OrientationBuilder(builder: (context, orientation) {
      return BlocProvider(
        create: (BuildContext context) =>
            ChannelCubit(ChannelController(channelId: channelId)),
        child: BlocBuilder<ChannelCubit, ChannelController>(
          builder: (context, channelState) {
            var deviceType = getDeviceType();
            return AutoTabsRouter.tabBar(
                key: ValueKey(channelState.channel),
                physics: const NeverScrollableScrollPhysics(),
                routes: [
                  ChannelInfoRoute(channel: channelState.channel),
                  ChannelVideoRoute(channel: channelState.channel),
                  ChannelShortsRoute(channel: channelState.channel),
                  ChannelStreamRoute(channel: channelState.channel),
                  ChannelPlaylistsRoute(
                      channelId: channelState.channel?.authorId)
                ],
                builder: (context, child, controller) {
                  final tabsRouter = AutoTabsRouter.of(context);

                  return Scaffold(
                    appBar: AppBar(
                      title: Text(
                        channelState.channel?.author ?? '',
                      ),
                      actions: channelState.loading
                          ? []
                          : [
                              Visibility(
                                visible: channelState.channel != null,
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () => showSharingSheet(
                                          context, channelState.channel!),
                                      icon: const Icon(Icons.share),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                    ),
                    backgroundColor: colorScheme.surface,
                    bottomNavigationBar: deviceType == DeviceType.tablet ||
                            channelState.loading
                        ? null
                        : FadeIn(
                            child: NavigationBar(
                              onDestinationSelected: tabsRouter.setActiveIndex,
                              selectedIndex: tabsRouter.activeIndex,
                              destinations: <Widget>[
                                NavigationDestination(
                                    icon: const Icon(Icons.info),
                                    label: locals.info),
                                NavigationDestination(
                                    icon: const Icon(Icons.play_arrow),
                                    label: locals.videos),
                                NavigationDestination(
                                    icon: const Icon(Icons.videocam),
                                    label: locals.shorts),
                                NavigationDestination(
                                    icon: const Icon(Icons.stream),
                                    label: locals.streams),
                                NavigationDestination(
                                    icon: const Icon(Icons.playlist_play),
                                    label: locals.playlists)
                              ],
                            ),
                          ),
                    body: SafeArea(
                        bottom: false,
                        child: Row(
                          children: [
                            if (deviceType == DeviceType.tablet)
                              NavigationRail(
                                extended:
                                    getOrientation() == Orientation.landscape,
                                destinations: [
                                  NavigationRailDestination(
                                      icon: const Icon(Icons.info),
                                      label: Text(locals.info)),
                                  NavigationRailDestination(
                                      icon: const Icon(Icons.play_arrow),
                                      label: Text(locals.videos)),
                                  NavigationRailDestination(
                                      icon: const Icon(Icons.videocam),
                                      label: Text(locals.shorts)),
                                  NavigationRailDestination(
                                      icon: const Icon(Icons.stream),
                                      label: Text(locals.streams)),
                                  NavigationRailDestination(
                                      icon: const Icon(Icons.playlist_play),
                                      label: Text(locals.playlists))
                                ],
                                selectedIndex: tabsRouter.activeIndex,
                                onDestinationSelected:
                                    tabsRouter.setActiveIndex,
                              ),
                            Expanded(
                              child: child,
                            ),
                          ],
                        )),
                  );
                });
          },
        ),
      );
    });
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/channels/states/channel.dart';
import 'package:invidious/channels/views/components/info.dart';
import 'package:invidious/channels/views/components/playlists.dart';
import 'package:invidious/channels/views/components/videos.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/views/components/navigation_switcher.dart';

import '../../../utils.dart';
import '../../../utils/views/components/placeholders.dart';

@RoutePage()
class ChannelScreen extends StatelessWidget {
  final String channelId;

  const ChannelScreen({super.key, required this.channelId});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (BuildContext context) =>
          ChannelCubit(ChannelController(channelId: channelId)),
      child: BlocBuilder<ChannelCubit, ChannelController>(
        builder: (context, channelState) {
          var cubit = context.read<ChannelCubit>();
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
                        child: IconButton(
                          onPressed: () =>
                              showSharingSheet(context, channelState.channel!),
                          icon: const Icon(Icons.share),
                        ),
                      ),
                    ],
            ),
            backgroundColor: colorScheme.background,
            bottomNavigationBar: channelState.loading
                ? null
                : FadeIn(
                    child: NavigationBar(
                      onDestinationSelected: cubit.selectIndex,
                      selectedIndex: channelState.selectedIndex,
                      destinations: <Widget>[
                        NavigationDestination(
                            icon: const Icon(Icons.info), label: locals.info),
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
            //.animate().slideY(duration: animationDuration, begin: 1, curve: Curves.easeInOutQuad),
            body: SafeArea(
                bottom: false,
                child: NavigationSwitcher(
                  child: <Widget>[
                    channelState.loading
                        ? const ChannelPlaceHolder()
                        : ChannelInfo(
                            key: const ValueKey('info'),
                            channel: channelState.channel!),
                    if (!channelState.loading)
                      ChannelVideosView(
                        key: const ValueKey('videos'),
                        channel: channelState.channel!,
                        getVideos: service.getChannelVideos,
                      ),
                    if (!channelState.loading)
                      ChannelVideosView(
                        key: const ValueKey('shorts'),
                        channel: channelState.channel!,
                        getVideos: service.getChannelShorts,
                      ),
                    if (!channelState.loading)
                      ChannelVideosView(
                        key: const ValueKey('streams'),
                        channel: channelState.channel!,
                        getVideos: service.getChannelStreams,
                      ),
                    if (!channelState.loading)
                      ChannelPlayListsView(
                          key: const ValueKey('playlists'),
                          channelId: channelState.channel!.authorId,
                          canDeleteVideos: false)
                  ][channelState.selectedIndex],
                )),
          );
        },
      ),
    );
  }
}

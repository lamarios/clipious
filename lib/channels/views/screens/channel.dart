// import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/channels/states/channel.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/channels/views/components/info.dart';
import 'package:invidious/channels/views/components/playlists.dart';
import 'package:invidious/channels/views/components/videos.dart';

import '../../../utils.dart';
import '../../../views/components/placeholders.dart';

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

    return BlocProvider(
      create: (BuildContext context) => ChannelCubit(ChannelController(widget.channelId, backgroundColor: colorScheme.background, vsync: this)),
      child: BlocBuilder<ChannelCubit, ChannelController>(
        builder: (context, _) {
          var cubit = context.read<ChannelCubit>();
          return Scaffold(
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
                : FadeIn(
                    child: NavigationBar(
                      backgroundColor: colorScheme.background,
                      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                      elevation: 0,
                      onDestinationSelected: cubit.selectIndex,
                      selectedIndex: _.selectedIndex,
                      destinations: <Widget>[
                        NavigationDestination(icon: const Icon(Icons.info), label: locals.info),
                        NavigationDestination(icon: const Icon(Icons.play_arrow), label: locals.videos),
                        NavigationDestination(icon: const Icon(Icons.videocam), label: locals.shorts),
                        NavigationDestination(icon: const Icon(Icons.stream), label: locals.streams),
                        NavigationDestination(icon: const Icon(Icons.playlist_play), label: locals.playlists)
                      ],
                    ),
                  ),
            //.animate().slideY(duration: animationDuration, begin: 1, curve: Curves.easeInOutQuad),
            body: SafeArea(
                bottom: false,
                child: AnimatedSwitcher(
                  duration: animationDuration,
                  child: <Widget>[
                    _.loading ? const ChannelPlaceHolder() : ChannelInfo(key: const ValueKey('info'), channel: _.channel!),
                    if (!_.loading)
                      ChannelVideosView(
                        key: const ValueKey('videos'),
                        channel: _.channel!,
                        getVideos: service.getChannelVideos,
                      ),
                    if (!_.loading)
                      ChannelVideosView(
                        key: const ValueKey('shorts'),
                        channel: _.channel!,
                        getVideos: service.getChannelShorts,
                      ),
                    if (!_.loading)
                      ChannelVideosView(
                        key: const ValueKey('streams'),
                        channel: _.channel!,
                        getVideos: service.getChannelStreams,
                      ),
                    if (!_.loading) ChannelPlayListsView(key: const ValueKey('playlists'), channelId: _.channel!.authorId, canDeleteVideos: false)
                  ][_.selectedIndex],
                )),
          );
        },
      ),
    );
  }
}

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/views/tv/screens/tv_home.dart';
import 'package:invidious/channels/states/channel.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/subscription_management/view/tv/tv_subscribe_button.dart';
import 'package:invidious/utils/models/image_object.dart';
import 'package:invidious/utils/models/paginatedList.dart';
import 'package:invidious/utils/views/components/placeholders.dart';
import 'package:invidious/utils/views/tv/components/tv_expandable_text.dart';
import 'package:invidious/utils/views/tv/components/tv_horizontal_item_list.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';
import 'package:invidious/videos/models/video_in_list.dart';

import '../../../../playlists/models/playlist.dart';
import '../../../../playlists/views/components/playlist_in_list.dart';
import '../../../../utils.dart';
import '../../../../videos/views/components/video_thumbnail.dart';
import '../../../states/tv_channel.dart';

class TvChannelView extends StatelessWidget {
  final String channelId;

  const TvChannelView({Key? key, required this.channelId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChannelCubit(ChannelController(channelId)),
          ),
          BlocProvider(
            create: (context) => TvChannelCubit(TvChannelController()),
          )
        ],
        child: BlocBuilder<ChannelCubit, ChannelController>(
          builder: (context, channel) => BlocBuilder<TvChannelCubit, TvChannelController>(builder: (context, tv) {
            var tvCubit = context.read<TvChannelCubit>();

            return channel.loading
                ? const Center(
                    child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()),
                  )
                : DefaultTextStyle(
                    style: textTheme.bodyLarge!,
                    child: Stack(
                      children: [
                        Positioned(top: 0, left: 0, right: 0, child: CachedNetworkImage(imageUrl: ImageObject.getBestThumbnail(channel.channel?.authorBanners)?.url ?? '')),
                        TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: tv.showBackground ? overlayBlur : 0),
                            duration: animationDuration,
                            curve: Curves.easeInOutQuad,
                            builder: (context, value, child) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: value,
                                  sigmaY: value,
                                ),
                                child: AnimatedContainer(
                                  color: colors.background.withOpacity(tv.showBackground ? overlayBackgroundOpacity : 0),
                                  duration: animationDuration,
                                  child: TvOverscan(
                                    child: ListView(controller: tv.scrollController, children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 100.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: AnimatedContainer(
                                            decoration:
                                                BoxDecoration(color: tv.showBackground ? colors.background.withOpacity(0) : colors.background.withOpacity(1), borderRadius: BorderRadius.circular(35)),
                                            duration: animationDuration,
                                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                                              Thumbnail(
                                                thumbnailUrl: ImageObject.getBestThumbnail(channel.channel?.authorThumbnails)?.url ?? '',
                                                width: 70,
                                                height: 70,
                                                id: 'author-big-${channel.channel?.authorId}',
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8.0, right: 20),
                                                child: Text(
                                                  channel.channel?.author ?? '',
                                                  style: textTheme.displaySmall,
                                                ),
                                              )
                                            ]),
                                          ),
                                        ),
                                      ),
                                      TvSubscribeButton(
                                        autoFocus: true,
                                        channelId: channelId,
                                        subCount: compactCurrency.format(channel.channel!.subCount),
                                        onFocusChanged: tvCubit.scrollToTop,
                                      ),
                                      TvExpandableText(
                                        text: channel.channel?.description ?? '',
                                        maxLines: 3,
                                      ),
                                      tv.hasVideos
                                          ? Padding(
                                              padding: const EdgeInsets.only(top: 20.0),
                                              child: Text(
                                                locals.videos,
                                                style: textTheme.titleLarge,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      TvHorizontalVideoList(
                                          paginatedVideoList: ContinuationList<VideoInList>((continuation) => service.getChannelVideos(channel.channel?.authorId ?? '', continuation).then((value) {
                                                tvCubit.setHasVideos(value.videos.isNotEmpty);
                                                return value;
                                              }))),
                                      tv.hasShorts
                                          ? Padding(
                                              padding: const EdgeInsets.only(top: 20.0),
                                              child: Text(
                                                locals.shorts,
                                                style: textTheme.titleLarge,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      TvHorizontalVideoList(
                                          paginatedVideoList: ContinuationList<VideoInList>((continuation) => service.getChannelShorts(channel.channel?.authorId ?? '', continuation).then((value) {
                                                tvCubit.setHasShorts(value.videos.isNotEmpty);
                                                return value;
                                              }))),
                                      tv.hasStreams
                                          ? Padding(
                                              padding: const EdgeInsets.only(top: 20.0),
                                              child: Text(
                                                locals.streams,
                                                style: textTheme.titleLarge,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      TvHorizontalVideoList(
                                          paginatedVideoList: ContinuationList<VideoInList>((continuation) => service.getChannelStreams(channel.channel?.authorId ?? '', continuation).then((value) {
                                                tvCubit.setHasStreams(value.videos.isNotEmpty);
                                                return value;
                                              }))),
                                      tv.hasPlaylist
                                          ? Padding(
                                              padding: const EdgeInsets.only(top: 20.0),
                                              child: Text(
                                                locals.playlists,
                                                style: textTheme.titleLarge,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      TvHorizontalItemList<Playlist>(
                                        getPlaceholder: () => const TvPlaylistPlaceHolder(),
                                        paginatedList:
                                            ContinuationList<Playlist>((continuation) => service.getChannelPlaylists(channel.channel?.authorId ?? '', continuation: continuation).then((value) {
                                                  tvCubit.setHasPlaylists(value.playlists.isNotEmpty);
                                                  return value;
                                                })),
                                        buildItem: (context, index, item) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: PlaylistInList(
                                              playlist: item,
                                              canDeleteVideos: false,
                                              isTv: true,
                                              // cameFromSearch: true,
                                            )),
                                      ),
                                    ]),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}

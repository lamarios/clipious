import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipious/app/views/tv/screens/tv_home.dart';
import 'package:clipious/channels/states/channel.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/subscription_management/view/tv/tv_subscribe_button.dart';
import 'package:clipious/utils/models/image_object.dart';
import 'package:clipious/utils/models/paginated_list.dart';
import 'package:clipious/utils/views/components/placeholders.dart';
import 'package:clipious/utils/views/components/thumbnail.dart';
import 'package:clipious/utils/views/tv/components/tv_expandable_text.dart';
import 'package:clipious/utils/views/tv/components/tv_horizontal_item_list.dart';
import 'package:clipious/utils/views/tv/components/tv_overscan.dart';
import 'package:clipious/videos/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../playlists/models/playlist.dart';
import '../../../../playlists/views/components/playlist_in_list.dart';
import '../../../../utils.dart';
import '../../../states/tv_channel.dart';

@RoutePage()
class TvChannelScreen extends StatelessWidget {
  final String channelId;

  const TvChannelScreen({super.key, required this.channelId});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ChannelCubit(ChannelController(channelId: channelId)),
          ),
          BlocProvider(
            create: (context) => TvChannelCubit(const TvChannelController()),
          )
        ],
        child: BlocBuilder<ChannelCubit, ChannelController>(
          builder: (context, channel) =>
              BlocBuilder<TvChannelCubit, TvChannelController>(
                  builder: (context, tv) {
            var tvCubit = context.read<TvChannelCubit>();

            return channel.loading
                ? const Center(
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator()),
                  )
                : DefaultTextStyle(
                    style: textTheme.bodyLarge!,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: CachedNetworkImage(
                                imageUrl: ImageObject.getBestThumbnail(
                                            channel.channel?.authorBanners)
                                        ?.url ??
                                    '')),
                        TweenAnimationBuilder(
                            tween: Tween<double>(
                                begin: 0,
                                end: tv.showBackground ? overlayBlur : 0),
                            duration: animationDuration,
                            curve: Curves.easeInOutQuad,
                            builder: (context, value, child) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: value,
                                  sigmaY: value,
                                ),
                                child: AnimatedContainer(
                                  color: colors.surface.withOpacity(
                                      tv.showBackground
                                          ? overlayBackgroundOpacity
                                          : 0),
                                  duration: animationDuration,
                                  child: TvOverscan(
                                    child: SingleChildScrollView(
                                      controller: tvCubit.scrollController,
                                      child: ListView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 100.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: AnimatedContainer(
                                                  decoration: BoxDecoration(
                                                      color: tv.showBackground
                                                          ? colors.surface
                                                              .withOpacity(0)
                                                          : colors.surface
                                                              .withOpacity(1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              35)),
                                                  duration: animationDuration,
                                                  child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Thumbnail(
                                                          thumbnails: ImageObject
                                                              .getThumbnailUrlsByPreferredOrder(
                                                                  channel
                                                                      .channel
                                                                      ?.authorThumbnails),
                                                          width: 70,
                                                          height: 70,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          35)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 8.0,
                                                                  right: 20),
                                                          child: Text(
                                                            channel.channel
                                                                    ?.author ??
                                                                '',
                                                            style: textTheme
                                                                .displaySmall,
                                                          ),
                                                        )
                                                      ]),
                                                ),
                                              ),
                                            ),
                                            TvSubscribeButton(
                                              autoFocus: true,
                                              channelId: channelId,
                                              subCount: compactCurrency.format(
                                                  channel.channel!.subCount),
                                              onFocusChanged:
                                                  tvCubit.scrollToTop,
                                            ),
                                            TvExpandableText(
                                              text: channel
                                                      .channel?.description ??
                                                  '',
                                              maxLines: 3,
                                            ),
                                            tv.hasVideos
                                                ? Padding(
                                                    key: tvCubit.videosTitle,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20.0),
                                                    child: Text(
                                                      locals.videos,
                                                      style:
                                                          textTheme.titleLarge,
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            TvHorizontalVideoList(
                                                onItemFocus:
                                                    (video, index, focus) =>
                                                        tvCubit.scrollTo(
                                                            tvCubit.videosTitle,
                                                            focus),
                                                paginatedVideoList: ContinuationList<
                                                    Video>((continuation) => service
                                                        .getChannelVideos(
                                                            channel.channel
                                                                    ?.authorId ??
                                                                '',
                                                            continuation)
                                                        .then((value) {
                                                      tvCubit.setHasVideos(value
                                                          .videos.isNotEmpty);
                                                      return value;
                                                    }))),
                                            tv.hasShorts
                                                ? Padding(
                                                    key: tvCubit.shortTitle,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20.0),
                                                    child: Text(
                                                      locals.shorts,
                                                      style:
                                                          textTheme.titleLarge,
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            TvHorizontalVideoList(
                                                onItemFocus:
                                                    (video, index, focus) =>
                                                        tvCubit.scrollTo(
                                                            tvCubit.shortTitle,
                                                            focus),
                                                paginatedVideoList: ContinuationList<
                                                    Video>((continuation) => service
                                                        .getChannelShorts(
                                                            channel.channel
                                                                    ?.authorId ??
                                                                '',
                                                            continuation)
                                                        .then((value) {
                                                      tvCubit.setHasShorts(value
                                                          .videos.isNotEmpty);
                                                      return value;
                                                    }))),
                                            tv.hasStreams
                                                ? Padding(
                                                    key: tvCubit.streamTitle,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20.0),
                                                    child: Text(
                                                      locals.streams,
                                                      style:
                                                          textTheme.titleLarge,
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            TvHorizontalVideoList(
                                                onItemFocus: (video, index,
                                                        focus) =>
                                                    tvCubit
                                                        .scrollTo(
                                                            tvCubit.streamTitle,
                                                            focus),
                                                paginatedVideoList: ContinuationList<
                                                        Video>(
                                                    (continuation) => service
                                                            .getChannelStreams(
                                                                channel.channel
                                                                        ?.authorId ??
                                                                    '',
                                                                continuation)
                                                            .then((value) {
                                                          tvCubit.setHasStreams(
                                                              value.videos
                                                                  .isNotEmpty);
                                                          return value;
                                                        }))),
                                            tv.hasPlaylist
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20.0),
                                                    child: Text(
                                                      locals.playlists,
                                                      style:
                                                          textTheme.titleLarge,
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            TvHorizontalItemList<Playlist>(
                                              getPlaceholder: () =>
                                                  const TvPlaylistPlaceHolder(),
                                              paginatedList: ContinuationList<
                                                      Playlist>(
                                                  (continuation) => service
                                                          .getChannelPlaylists(
                                                              channel.channel
                                                                      ?.authorId ??
                                                                  '',
                                                              continuation:
                                                                  continuation)
                                                          .then((value) {
                                                        tvCubit.setHasPlaylists(
                                                            value.playlists
                                                                .isNotEmpty);
                                                        return value;
                                                      })),
                                              buildItem: (context, index,
                                                      item) =>
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
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

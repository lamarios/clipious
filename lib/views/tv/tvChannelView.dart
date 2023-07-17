import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/channelController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/channelPlaylists.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/tv/tvExpandableText.dart';
import 'package:invidious/views/tv/tvHorizontalPaginatedListView.dart';
import 'package:invidious/views/tv/tvHorizontalVideoList.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/views/tv/tvSubscribeButton.dart';

import '../../controllers/tvChannelController.dart';
import '../../models/playlist.dart';
import '../../utils.dart';
import '../components/videoThumbnail.dart';
import '../playlists/playlist.dart';

class TvChannelView extends StatelessWidget {
  final String channelId;

  const TvChannelView({Key? key, required this.channelId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: GetBuilder<TvChannelController>(
          init: TvChannelController(channelId),
          global: false,
          builder: (_) {
            return _.loading
                ? const Center(
                    child: CircularProgressIndicator(),
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
                                            _.channel?.authorBanners)
                                        ?.url ??
                                    '')),
                        TvOverscan(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: ListView(
                                controller: _.scrollController,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              colors.background.withOpacity(1),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Thumbnail(
                                              thumbnailUrl:
                                                  ImageObject.getBestThumbnail(_
                                                              .channel
                                                              ?.authorThumbnails)
                                                          ?.url ??
                                                      '',
                                              width: 70,
                                              height: 70,
                                              id: 'author-big-${_.channel?.authorId}',
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          35)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 20),
                                              child: Text(
                                                _.channel?.author ?? '',
                                                style: textTheme.displaySmall,
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                  TvSubscribeButton(
                                    autoFocus: true,
                                    channelId: channelId,
                                    subCount: compactCurrency
                                        .format(_.channel!.subCount),
                                    onFocusChanged: _.scrollToTop,
                                  ),
                                  TvExpandableText(
                                    text: _.channel?.description ?? '',
                                    maxLines: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      locals.videos,
                                      style: textTheme.titleLarge,
                                    ),
                                  ),
                                  TvHorizontalVideoList(
                                      paginatedVideoList:
                                          ContinuationList<VideoInList>(
                                              (continuation) =>
                                                  service.getChannelVideos(
                                                      _.channel?.authorId ?? '',
                                                      continuation))),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      locals.shorts,
                                      style: textTheme.titleLarge,
                                    ),
                                  ),
                                  TvHorizontalVideoList(
                                      paginatedVideoList:
                                          ContinuationList<VideoInList>(
                                              (continuation) =>
                                                  service.getChannelShorts(
                                                      _.channel?.authorId ?? '',
                                                      continuation))),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      locals.streams,
                                      style: textTheme.titleLarge,
                                    ),
                                  ),
                                  TvHorizontalVideoList(
                                      paginatedVideoList:
                                          ContinuationList<VideoInList>(
                                              (continuation) =>
                                                  service.getChannelStreams(
                                                      _.channel?.authorId ?? '',
                                                      continuation))),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      locals.playlists,
                                      style: textTheme.titleLarge,
                                    ),
                                  ),
                                  TvHorizontalItemList<Playlist>(
                                    paginatedList: ContinuationList<Playlist>(
                                        (continuation) =>
                                            service.getChannelPlaylists(
                                                _.channel?.authorId ?? '',
                                                continuation: continuation)),
                                    buildItem: (context, index, item) =>
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: PlaylistItem(
                                              playlist: item,
                                              canDeleteVideos: false,
                                              isTv: true,
                                              // cameFromSearch: true,
                                            )),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}

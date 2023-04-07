import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/channelController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/imageObject.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/models/videoInList.dart';
import 'package:invidious/views/tv/tvExpandableText.dart';
import 'package:invidious/views/tv/tvHorizontalVideoList.dart';
import 'package:invidious/views/tv/tvSubscribeButton.dart';

import '../../utils.dart';
import '../components/videoThumbnail.dart';

class TvChannelView extends StatelessWidget {
  final String channelId;

  const TvChannelView({Key? key, required this.channelId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    const TextStyle titleStile = TextStyle(fontSize: 20);
    return Scaffold(
      body: GetBuilder<ChannelController>(
          init: ChannelController(channelId),
          global: false,
          builder: (_) {
            return _.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    children: [
                      Positioned(top: 0, left: 0, right: 0, child: CachedNetworkImage(imageUrl: ImageObject.getBestThumbnail(_.channel?.authorBanners)?.url ?? '')),
                      Padding(
                        padding: const EdgeInsets.only(left:40, right: 40, top: 125, bottom:40),
                        child: ListView(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(color: colors.background.withOpacity(1), borderRadius: BorderRadius.circular(35)),
                              child: Row(mainAxisSize: MainAxisSize.min, children: [
                                Thumbnail(
                                  thumbnailUrl: ImageObject.getBestThumbnail(_.channel?.authorThumbnails)?.url ?? '',
                                  width: 70,
                                  height: 70,
                                  id: 'author-big-${_.channel?.authorId}',
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 20),
                                  child: Text(
                                    _.channel?.author ?? '',
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                )
                              ]),
                            ),
                          ),
                          TvSubscribeButton(autoFocus: true,channelId: channelId, subCount: compactCurrency.format(_.channel!.subCount)),
                          TvExpandableText(text: _.channel?.description ??'', maxLines: 3,),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              locals.latestVideos,
                              style: titleStile,
                            ),
                          ),
                          TvHorizontalVideoList(paginatedVideoList: FixedItemList(_.channel?.latestVideos ?? [])),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              locals.videos,
                              style: titleStile,
                            ),
                          ),
                          TvHorizontalVideoList(paginatedVideoList: ContinuationList<VideoInList>((continuation) => service.getChannelVideos(_.channel?.authorId ?? '', continuation))),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              locals.streams,
                              style: titleStile,
                            ),
                          ),
                          TvHorizontalVideoList(paginatedVideoList: ContinuationList<VideoInList>((continuation) => service.getChannelStreams(_.channel?.authorId ?? '', continuation))),
                        ]),
                      ),
                    ],
                  );
          }),
    );
  }
}

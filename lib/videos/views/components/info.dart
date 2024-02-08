import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/router.dart';
import 'package:invidious/utils/views/components/text_linkified.dart';
import 'package:invidious/videos/models/video.dart';
import 'package:invidious/videos/views/components/video_metrics.dart';
import 'package:invidious/videos/views/components/video_thumbnail.dart';

import '../../../subscription_management/view/components/subscribe_button.dart';
import '../../../utils/models/image_object.dart';

class VideoInfo extends StatelessWidget {
  final Video video;
  final int? dislikes;
  final bool titleAndChannelInfo, descriptionAndTags;

  const VideoInfo(
      {super.key,
      required this.video,
      this.dislikes,
      this.titleAndChannelInfo = true,
      this.descriptionAndTags = true});

  openChannel(BuildContext context) {
    AutoRouter.of(context).push(ChannelRoute(channelId: video.authorId!));
  }

  showSearchWindow(BuildContext context, String query) {
    AutoRouter.of(context).push(SearchRoute(
      query: query,
      searchNow: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    var player = context.read<PlayerCubit>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleAndChannelInfo)
            Text(
              video.title,
              style: textTheme.titleLarge?.copyWith(color: colorScheme.primary),
              textAlign: TextAlign.start,
            ),
          if (titleAndChannelInfo)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: VideoMetrics(
                video: video,
                dislikes: dislikes,
                style: textTheme.bodyMedium,
                iconSize: 15,
              ),
            ),
          if (titleAndChannelInfo)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => openChannel(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Thumbnail(
                      thumbnailUrl:
                          ImageObject.getBestThumbnail(video.authorThumbnails)
                                  ?.url ??
                              '',
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                    ) /*Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorScheme.onSurface,
                        image: DecorationImage(image: NetworkImage(ImageObject.getBestThumbnail(video?.authorThumbnails)?.url ?? ''), fit: BoxFit.cover)),
                  )*/
                    ,
                  ),
                ),
                Expanded(
                    child: InkWell(
                        onTap: () => openChannel(context),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(video.author ?? ''),
                        ))),
              ],
            ),
          if (titleAndChannelInfo)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SubscribeButton(
                    channelId: video.authorId ?? '',
                    subCount: video.subCountText,
                  ),
                )
              ],
            ),
          if (descriptionAndTags)
            TextLinkified(
              text: video.description,
              video: video,
              player: player,
            ),
          if (descriptionAndTags) const Divider(),
          if (descriptionAndTags)
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 15,
                  ),
                ),
                Text(
                    video.isListed ? locals.videoListed : locals.videoUnlisted),
                Visibility(
                  visible: video.isFamilyFriendly,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      Icons.child_care,
                      size: 15,
                    ),
                  ),
                ),
                Visibility(
                    visible: video.isFamilyFriendly,
                    child: Text(locals.videoIsFamilyFriendly))
              ],
            ),
          if (descriptionAndTags)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: video.keywords
                      .map((e) => InkWell(
                            onTap: () => showSearchWindow(context, e),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: Text(e),
                              ),
                            ),
                          ))
                      .toList(growable: true)
                    ..insert(
                        0,
                        InkWell(
                          onTap: () => showSearchWindow(context, video.genre),
                          child: Container(
                            decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4),
                              child: Text(video.genre),
                            ),
                          ),
                        ))),
            )
        ],
      ),
    );
  }
}

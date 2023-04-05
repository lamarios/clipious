import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/views/channel.dart';
import 'package:invidious/views/components/subscribeButton.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/imageObject.dart';
import '../../utils.dart';
import '../searchDelegate.dart';

class VideoInfo extends StatelessWidget {
  Video video;

  VideoInfo({super.key, required this.video});

  openChannel(BuildContext context) {
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_CHANNEL, builder: (context) => ChannelView(channelId: video.authorId ?? '')));
  }

  showSearchWindow(BuildContext context, String query) {
    showSearch(context: context, delegate: MySearchDelegate(), query: query);
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title ?? '',
            style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.normal, fontSize: 20),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Visibility(
                    visible: video.likeCount > 0,
                    child: const Icon(
                      Icons.thumb_up,
                      size: 15,
                    )),
                Visibility(
                    visible: video.likeCount > 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(compactCurrency.format(video.likeCount)),
                    )),
                Visibility(
                    visible: video.viewCount > 0,
                    child: const Icon(
                      Icons.visibility,
                      size: 15,
                    )),
                Visibility(
                    visible: video.viewCount > 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(compactCurrency.format(video.viewCount)),
                    )),
                Expanded(child: Container()),
                Visibility(
                  visible: !video.liveNow,
                  child: Expanded(
                      child: Text(
                    video.publishedText,
                    textAlign: TextAlign.end,
                  )),
                ),
                Visibility(
                  visible: video.liveNow,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.podcasts,
                            size: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              locals.streamIsLive,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => openChannel(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Thumbnail(
                    thumbnailUrl: ImageObject.getBestThumbnail(video.authorThumbnails)?.url ?? '',
                    width: 40,
                    height: 40,
                    id: 'author-small-${video.authorId}',
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
          SelectableLinkify(
              text: video.description,
              linkStyle: TextStyle(color: colorScheme.primary, decoration: TextDecoration.none),
              onOpen: (link) => launchUrl(Uri.parse(link.url), mode: LaunchMode.externalApplication),
              options: const LinkifyOptions(humanize: true, removeWww: true)),
          const Divider(),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Icon(
                  Icons.remove_red_eye,
                  size: 15,
                ),
              ),
              Text(video.isListed ? locals.videoListed : locals.videoUnlisted),
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
              Visibility(visible: video.isFamilyFriendly, child: Text(locals.videoIsFamilyFriendly))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: video.keywords
                    .map((e) => InkWell(
                          onTap: () => showSearchWindow(context, e),
                          child: Container(
                            decoration: BoxDecoration(color: colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
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
                          decoration: BoxDecoration(color: colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
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

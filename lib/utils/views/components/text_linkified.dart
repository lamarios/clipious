import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:invidious/player/states/player.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globals.dart';
import '../../../main.dart';
import '../../../videos/models/base_video.dart';
import '../../../videos/views/screens/video.dart';
import '../../models/timestampLinkifier.dart';

class TextLinkified extends StatelessWidget {
  final String text;
  final BaseVideo? video;
  final PlayerCubit player;

  const TextLinkified({super.key, required this.text, this.video, required this.player});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return SelectableLinkify(
      text: text,
      linkStyle: TextStyle(color: colorScheme.primary, decoration: TextDecoration.none),
      onOpen: openLink,
      options: const LinkifyOptions(humanize: true, removeWww: true),
      linkifiers: const [UrlLinkifier(), TimestampLinkifier()],
    );
  }

  void openLink(LinkableElement link) {
    if (link is UrlElement) {
      var uri = Uri.parse(link.url);
      if (YOUTUBE_HOSTS.contains(uri.host)) {
        if (uri.pathSegments.length == 1 && uri.pathSegments.contains("watch") && uri.queryParameters.containsKey('v')) {
          String videoId = uri.queryParameters['v']!;
          navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) => VideoView(
                    videoId: videoId,
                  )));
        }
        if (uri.host == 'youtu.be' && uri.pathSegments.length == 1) {
          String videoId = uri.pathSegments[0];
          navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) => VideoView(
                    videoId: videoId,
                  )));
        }
      } else {
        launchUrl(Uri.parse(link.url), mode: LaunchMode.externalApplication);
      }
    } else if (link is TimestampElement) {
      var split = link.url.split(':');
      if (split.length >= 2 && split.length <= 3) {
        bool hours = split.length == 3;
        Duration position = Duration(hours: hours ? int.parse(split[0]) : 0, minutes: int.parse(split[hours ? 1 : 0]), seconds: int.parse(split[hours ? 2 : 1]));
        var videoPlaying = (player.state.isPlaying ?? false) && player.state.currentlyPlaying?.videoId == video?.videoId;
        if (videoPlaying) {
          player.seek(position);
        } else if (video != null) {
          player.playVideo([video!], startAt: position);
        }
      }
    }
  }
}

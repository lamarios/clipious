import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:invidious/models/channel.dart';
import 'package:invidious/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/videoInList.dart';
import '../videoList/singleVideo.dart';

class ChannelInfo extends StatefulWidget {
  final Channel channel;

  const ChannelInfo({super.key, required this.channel});

  @override
  ChannelInfoState createState() => ChannelInfoState();
}

class ChannelInfoState extends State<ChannelInfo> {
  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;

    List<Widget> widgets = [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SelectableLinkify(
            text: widget.channel.description,
            linkStyle: TextStyle(color: colors.primary, decoration: TextDecoration.none),
            onOpen: (link) => launchUrl(Uri.parse(link.url), mode: LaunchMode.externalApplication),
            options: const LinkifyOptions(humanize: true, removeWww: true)),
      ),
      Text(
        locals.latestVideos,
        style: TextStyle(color: colors.secondary, fontSize: 20),
      ),
    ];

    widgets.add(GridView.count(
        crossAxisCount: getGridCount(context),
        padding: const EdgeInsets.all(4),
        crossAxisSpacing: 5,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        mainAxisSpacing: 5,
        childAspectRatio: getGridAspectRatio(context),
        children:
            widget.channel.latestVideos?.map((e) => VideoListItem(video: VideoInList(e.title, e.videoId, e.lengthSeconds, 0, e.author, '', 'authorUrl', 0, '', e.videoThumbnails))).toList() ?? []));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ),
      ),
    );
  }
}

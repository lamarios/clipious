import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/models/channel.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/components/subscribeButton.dart';

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
    ColorScheme colors = Theme.of(context).colorScheme;

    List<Widget> widgets = [
      Row(
        children: [
          Expanded(
              child: Text(
                widget.channel.author,
                style: TextStyle(color: colors.primary, fontWeight: FontWeight.normal, fontSize: 20),
                textAlign: TextAlign.start,
              )),
          SubscribeButton(channelId: widget.channel.authorId, subCount: compactCurrency.format(widget.channel.subCount))
        ],

      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(widget.channel.description),
      ),
      Text(
        'Latest Videos',
        style: TextStyle(color: colors.secondary, fontSize: 20),
      ),
    ];

    widgets.addAll(widget.channel.latestVideos.map((e) => VideoListItem(video: VideoInList(e.title, e.videoId, e.lengthSeconds, 0, e.author, '', 'authorUrl', 0, '', e.videoThumbnails))).toList());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}

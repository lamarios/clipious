import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/channelVideos.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/videoList.dart';
import 'package:invidious/views/videoList/singleVideo.dart';

import '../../models/channel.dart';
import '../../models/video.dart';
import '../../models/videoInList.dart';
import '../../utils.dart';

class ChannelVideosView extends StatefulWidget {
  final Channel channel;
  final Future<ChannelVideos> Function(String channelId, String? continuation) getVideos;

  const ChannelVideosView({super.key, required this.channel, required this.getVideos});

  @override
  State<ChannelVideosView> createState() => _ChannelVideosViewState();
}

class _ChannelVideosViewState extends State<ChannelVideosView> {
  String? continuation;

  Future<List<VideoInList>> getVideos() async {
    // ChannelVideos videos = await service.getChannelVideos(widget.channel.authorId, continuation);
    ChannelVideos videos = await widget.getVideos(widget.channel.authorId, continuation);

    setState(() {
      continuation = videos.continuation;
    });
    return videos.videos;
  }

  Future<List<VideoInList>> refreshVideos() async {
    setState(() {
      continuation = null;
    });
    return getVideos();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.background,
      child: VideoList(
        getVideos: getVideos,
        refresh: refreshVideos,
        getMoreVideos: getVideos,
      ),
    );
  }
}

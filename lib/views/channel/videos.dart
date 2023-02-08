import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/channelVideos.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/videoList.dart';
import 'package:invidious/views/videoList/singleVideo.dart';

import '../../models/channel.dart';
import '../../models/video.dart';
import '../../models/videoInList.dart';

class ChannelVideosView extends StatefulWidget {
  final Channel channel;

  const ChannelVideosView({super.key, required this.channel});

  @override
  State<ChannelVideosView> createState() => _ChannelVideosViewState();
}

class _ChannelVideosViewState extends State<ChannelVideosView> with AfterLayoutMixin<ChannelVideosView> {
  List<VideoInList> videos = [];
  String? continuation;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<Widget> widgets = [
      Text(
        'Videos',
        style: TextStyle(color: colorScheme.secondary, fontSize: 20),
      ),
    ];

    widgets.addAll(videos.map((e) => VideoListItem(video: VideoInList(e.title, e.videoId, e.lengthSeconds, 0, e.author, '', 'authorUrl', 0, '', e.videoThumbnails))).toList());

    if (!loading && continuation != null && continuation!.isNotEmpty) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 20,
              child: Container(
                alignment: Alignment.center,
                child: FilledButton.tonal(
                    onPressed: loadVideos,
                    child: const Text(
                      'Load more',
                    )),
              )),
        ),
      );
    }

    if (loading) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(alignment: Alignment.center, child: const CircularProgressIndicator()),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  loadVideos() async {
    setState(() {
      loading = true;
    });
    ChannelVideos videos = await service.getChannelVideos(widget.channel.authorId, continuation);
    setState(() {
      this.videos.addAll(videos.videos);
      continuation = videos.continuation;
      loading = false;
    });
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    await loadVideos();
  }
}

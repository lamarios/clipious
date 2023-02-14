import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/video/player.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import '../../globals.dart';
import 'comments.dart';
import 'info.dart';

class VideoInnerView extends StatefulWidget {
  final Video video;
  final int selectedIndex;

  const VideoInnerView({super.key, required this.video, required this.selectedIndex});

  @override
  State<VideoInnerView> createState() => _VideoInnerViewState();
}

class _VideoInnerViewState extends State<VideoInnerView> {
  double scale = 1.0;
  bool elevateThumbnail = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  dispose() async {
    super.dispose();
    scrollController.dispose();
  }

  @override
  didUpdateWidget(VideoInnerView old){
    super.didUpdateWidget(old);
    if(old.selectedIndex != widget.selectedIndex){
      scrollController.animateTo(0, duration: animationDuration, curve: Curves.easeInOutQuad);
    }
  }

  onScroll() {
    setState(() {
      scale = 1 + min(0.03, ((scrollController.offset) / 20000));
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedScale(
          scale: scale,
          duration: Duration.zero,
          // curve: Curves.easeInOutQuad,
          child: VideoPlayer(
            video: widget.video,
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: ListView(
            controller: scrollController,
            children: [
              AnimatedSwitcher(
                  duration: animationDuration,
                  child: <Widget>[
                    VideoInfo(
                      video: widget.video,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Comments',
                          style: TextStyle(color: colorScheme.secondary, fontSize: 20),
                        ),
                        CommentsView(
                          videoId: widget.video.videoId,
                        ),
                      ],
                    ),
                    RecommendedVideos(video: widget.video)
                  ][widget.selectedIndex])
            ],
          ),
        )),
      ],
    );
  }
}

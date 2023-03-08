import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/video/commentsContainer.dart';
import 'package:invidious/views/video/player.dart';
import 'package:invidious/views/video/recommendedVideos.dart';

import '../../globals.dart';
import 'comments.dart';
import 'info.dart';

class VideoTabletInnerView extends StatefulWidget {
  final Video video;
  final int selectedIndex;

  const VideoTabletInnerView({super.key, required this.video, required this.selectedIndex});

  @override
  State<VideoTabletInnerView> createState() => _VideoTabletInnerViewState();
}

class _VideoTabletInnerViewState extends State<VideoTabletInnerView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() async {
    super.dispose();
    scrollController.dispose();
  }

  @override
  didUpdateWidget(VideoTabletInnerView old) {
    super.didUpdateWidget(old);
    if (old.selectedIndex != widget.selectedIndex) {
      scrollController.animateTo(0, duration: animationDuration, curve: Curves.easeInOutQuad);
    }
  }


  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: VideoPlayer(
                    miniPlayer: false,
                      video: widget.video,

                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        AnimatedSwitcher(
                            duration: animationDuration,
                            child: <Widget>[
                              VideoInfo(
                                video: widget.video,
                              ),
                              CommentsContainer(video: widget.video),
                              RecommendedVideos(video: widget.video)
                            ][widget.selectedIndex])
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
        SizedBox(width: 350, child: SingleChildScrollView(child: RecommendedVideos(video: widget.video)))
      ],
    );
  }
}

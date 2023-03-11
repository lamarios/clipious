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

class VideoInnerView extends StatefulWidget {
  final Video video;
  final int selectedIndex;
  final Function(DragUpdateDetails) onVideoDrag;
  final Function(DragEndDetails) onDragEnd;
  bool? playNow;

  VideoInnerView({super.key, required this.video, required this.selectedIndex, required this.onVideoDrag, required this.onDragEnd, this.playNow});

  @override
  State<VideoInnerView> createState() => _VideoInnerViewState();
}

class _VideoInnerViewState extends State<VideoInnerView> {
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
  didUpdateWidget(VideoInnerView old){
    super.didUpdateWidget(old);
    if(old.selectedIndex != widget.selectedIndex){
      scrollController.animateTo(0, duration: animationDuration, curve: Curves.easeInOutQuad);
    }
  }


  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         GestureDetector(
            onVerticalDragUpdate: widget.onVideoDrag,
            onVerticalDragEnd: widget.onDragEnd,
            child: VideoPlayer(
              playNow: widget.playNow,
              miniPlayer: false,
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
                    CommentsContainer(video: widget.video,),
                    RecommendedVideos(video: widget.video)
                  ][widget.selectedIndex])
            ],
          ),
        )),
      ],
    );
  }
}

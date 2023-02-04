import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/views/video.dart';

import 'package:after_layout/after_layout.dart';
import '../globals.dart';
import '../models/videoInList.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class VideoList extends StatefulWidget {
  String title;
  Function getVideos;

  VideoList({super.key, required this.title, required this.getVideos});

  @override
  VideoListState createState() => VideoListState();
}

class VideoListState extends State<VideoList> with AfterLayoutMixin<VideoList> {
  List<VideoInList> videos = [];
  bool loading = true;

  openVideo(BuildContext context, VideoInList video) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoView(videoId: video.videoId)));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            widget.title,
            style: TextStyle(color: colorScheme.primary, fontSize: 30),
          ),
        ),
        Visibility(visible: loading, child: const LinearProgressIndicator()),
        Expanded(
          child: loading
              ? Container(color: colorScheme.background)
              : FadeIn(
                  duration: animationDuration,
                  curve: Curves.easeInOutQuad,
                  child: GridView.count(
                      crossAxisCount: 1,
                      padding: EdgeInsets.all(4),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1.5,
                      children: videos
                          .map((v) => GestureDetector(
                                onTap: () {
                                  openVideo(context, v);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: colorScheme.onSurface,
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: NetworkImage(v.getBestThumbnail()?.url ?? ''), fit: BoxFit.cover)),
                                    ),
                                    Text(
                                      v.title,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      v.author,
                                      style: TextStyle(color: colorScheme.onSurface),
                                    )
                                  ],
                                ),
                              ))
                          .toList()),
                ),
        ),
      ],
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    widget.getVideos().then((videos) {
      setState(() {
        this.videos = videos;
        loading = false;
      });
    });
  }
}

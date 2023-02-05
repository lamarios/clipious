import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/views/video.dart';

import 'package:after_layout/after_layout.dart';
import '../globals.dart';
import '../models/videoInList.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

NumberFormat compactCurrency = NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol: '', // if you want to add currency symbol then pass that in this else leave it empty.
);

class VideoList extends StatefulWidget {
  String title;
  Function? getVideos;
  List<VideoInList>? videos;

  VideoList({super.key, required this.title, this.getVideos, this.videos});

  @override
  VideoListState createState() => VideoListState();
}

class VideoListState extends State<VideoList> with AfterLayoutMixin<VideoList> {
  List<VideoInList> videos = [];
  bool loading = true;
  bool hasMethod = false;

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
            style: TextStyle(color: colorScheme.primary, fontSize: 25),
          ),
        ),
        Visibility(visible: loading, child: const LinearProgressIndicator()),
        Expanded(
          child: loading
              ? Container(color: colorScheme.background)
              : FadeIn(
                  duration: animationDuration,
                  curve: Curves.easeInOutQuad,
                  child: Visibility(
                    visible: widget.videos?.isNotEmpty ?? videos.isNotEmpty,
                    child: GridView.count(
                        crossAxisCount: 1,
                        padding: EdgeInsets.all(4),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 16 / 13,
                        children: (widget.videos ?? videos)
                            .map((v) => GestureDetector(
                                  onTap: () {
                                    openVideo(context, v);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: colorScheme.onSurface,
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(image: NetworkImage(v.getBestThumbnail()?.url ?? ''), fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Text(
                                        v.title,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              v.author,
                                              style: TextStyle(color: colorScheme.onSurface),
                                            ),
                                          ),
                                          Visibility(visible: v.viewCount > 0, child: Icon(Icons.visibility)),
                                          Visibility(
                                              visible: v.viewCount > 0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 5.0),
                                                child: Text(compactCurrency.format(v.viewCount)),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                            .toList()),
                  ),
                ),
        ),
      ],
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.getVideos != null) {
      widget.getVideos!().then((List<VideoInList> videos) {
        setState(() {
          hasMethod = true;
          this.videos = videos;
          loading = false;
        });
      });
    } else if (widget.videos != null) {
      setState(() {
        loading = false;
      });
    }
  }
}

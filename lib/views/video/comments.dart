import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoComments.dart';
import 'package:invidious/views/video/comment.dart';

class CommentsView extends StatefulWidget {
  final String videoId;
  String? continuation;

  CommentsView({super.key, required this.videoId, this.continuation});

  @override
  CommentsViewState createState() => CommentsViewState();
}

class CommentsViewState extends State<CommentsView> with AfterLayoutMixin<CommentsView> {
  bool loadingComments = true;
  late VideoComments comments;

  @override
  void initState() {
    super.initState();
    comments = VideoComments(0, widget.videoId, '', []);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return loadingComments
        ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(alignment:Alignment.center,child: const SizedBox(height: 20, width: 20, child: CircularProgressIndicator())),
        )
        : Column(
            children: comments.comments
                .map((c) => SingleCommentView(
                      videoId: widget.videoId,
                      comment: c,
                    ))
                .toList(),
          );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    VideoComments comments = await service.getComments(widget.videoId, widget.continuation);
    setState(() {
      this.comments = comments;
      loadingComments = false;
    });
  }
}

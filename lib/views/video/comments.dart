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
  bool continuationLoaded = false;
  String? continuation;

  @override
  void initState() {
    super.initState();
    comments = VideoComments(0, widget.videoId, '', []);
  }

  loadMore() async {
    setState(() {
      loadingComments = true;
    });
    VideoComments comments = await service.getComments(widget.videoId, continuation);
    setState(() {
      this.comments.comments.addAll(comments.comments);
      continuation = comments.continuation;
      loadingComments = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.addAll(comments.comments
        .map((c) => SingleCommentView(
              videoId: widget.videoId,
              comment: c,
            ))
        .toList(growable: true));

    if (continuation != null) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: SizedBox(
              height: 15,
              child: FilledButton.tonal(
                  onPressed: loadMore,
                  child: Text(
                    'Load more',
                    style: TextStyle(fontSize: 10),
                  ))),
        ),
      );
    }

    if (loadingComments) {
      print('loading ? ${loadingComments}');
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(alignment: Alignment.center, child: const SizedBox(height: 20, width: 20, child: CircularProgressIndicator())),
      ));
    }
    return Column(
      children: widgets,
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    VideoComments comments = await service.getComments(widget.videoId, widget.continuation);
    setState(() {
      this.comments = comments;
      loadingComments = false;
      continuation = comments.continuation;
    });
  }
}

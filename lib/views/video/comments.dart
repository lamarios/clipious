import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/errors/invidiousServiceError.dart';
import 'package:invidious/models/videoComments.dart';
import 'package:invidious/views/video/comment.dart';

class CommentsView extends StatefulWidget {
  final String videoId;
  String? continuation;
  String? source;
  String? sortBy;

  CommentsView({super.key, required this.videoId, this.continuation, this.source, this.sortBy});

  @override
  CommentsViewState createState() => CommentsViewState();
}

class CommentsViewState extends State<CommentsView> with AfterLayoutMixin<CommentsView> {
  bool loadingComments = true;
  late VideoComments comments;
  bool continuationLoaded = false;
  String? continuation;
  String error = '';

  @override
  void initState() {
    super.initState();
    comments = VideoComments(0, widget.videoId, '', []);
  }

  loadMore() async {
    setState(() {
      loadingComments = true;
    });
    VideoComments comments = await service.getComments(widget.videoId, continuation: continuation);
    setState(() {
      this.comments.comments.addAll(comments.comments);
      continuation = comments.continuation;
      loadingComments = false;
    });
  }

  @override
  void didUpdateWidget(covariant CommentsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source != widget.source || oldWidget.sortBy != widget.sortBy) {
      getComments();
    }
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    List<Widget> widgets = [];

    widgets.addAll(comments.comments
        .map((c) => SingleCommentView(
              videoId: widget.videoId,
              comment: c,
            ))
        .toList(growable: true));

    if (continuation != null && !loadingComments) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: SizedBox(
              height: 15,
              child: FilledButton.tonal(
                  onPressed: loadMore,
                  child:  Text(
                    locals.loadMore,
                    style: TextStyle(fontSize: 10),
                  ))),
        ),
      );
    }

    if (loadingComments) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.center,
            child: const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ))),
      ));
    }
    return error.isNotEmpty
        ? Text(error)
        : Column(
            children: widgets,
          );
  }

  getComments() async {
    setState(() {
      error = '';
      loadingComments = true;
      this.comments = VideoComments(0, widget.videoId, '', []);
    });

    try {
      VideoComments comments = await service.getComments(widget.videoId, continuation: widget.continuation, sortBy: widget.sortBy, source: widget.source);
      setState(() {
        this.comments = comments;
        loadingComments = false;
        continuation = comments.continuation;
      });
    } catch (err) {
      if (err is InvidiousServiceError) {
        setState(() {
          error = err.message;
        });
      } else {
        setState(() {
          error = err.toString();
        });
        rethrow;
      }
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    getComments();
  }
}

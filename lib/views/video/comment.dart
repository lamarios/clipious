import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/video/comments.dart';
import 'package:path/path.dart';

import '../../models/comment.dart';
import '../../models/videoComments.dart';

class SingleCommentView extends StatefulWidget {
  final Comment comment;
  final String videoId;

  const SingleCommentView({super.key, required this.comment, required this.videoId});

  @override
  SingleCommentViewState createState() => SingleCommentViewState();
}

class SingleCommentViewState extends State<SingleCommentView> {
  bool showingChildren = false;

  VideoComments? children;

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var comment = widget.comment;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(20),
                  image: comment.authorThumbnails.isNotEmpty ? DecorationImage(image: NetworkImage(comment.getBestAuthorThumbnail()?.url ?? '')) : null),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.author,
                  style: TextStyle(color: colors.secondary),
                ),
                Text(comment.content),
                Row(
                  children: [
                    Expanded(child: Text(comment.publishedText)),
                    Visibility(visible: comment.likeCount > 0, child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Icon(Icons.thumb_up,size: 15, color: colors.secondary),
                    )),
                    Visibility(visible: comment.likeCount > 0, child: Text(comment.likeCount.toString()))
                  ],
                ),
                Visibility(
                    visible: comment.replies != null && !showingChildren,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: SizedBox(
                          height: 15,
                          child: FilledButton.tonal(
                              onPressed: () {
                                setState(() {
                                  showingChildren = !showingChildren;
                                });
                              },
                              child: Text(
                                '${(comment.replies?.replyCount ?? 0).toString()} replies',
                                style: TextStyle(fontSize: 10),
                              ))),
                    )),
                Visibility(
                    visible: showingChildren,
                    child: CommentsView(
                      videoId: widget.videoId,
                      continuation: comment.replies?.continuation,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

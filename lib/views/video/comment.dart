import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/views/channel.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video/comments.dart';

import '../../models/comment.dart';
import '../../models/imageObject.dart';
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


  openChannel(BuildContext context, String authorId){
    Navigator.push(context, MaterialPageRoute(settings: ROUTE_CHANNEL, builder: (context) => ChannelView(channelId: authorId)));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    var comment = widget.comment;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => openChannel(context, comment.authorId),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Thumbnail(
                width: 20,
                height: 20,
                id: 'comment-author-${comment.authorId}',
                thumbnailUrl: ImageObject.getBestThumbnail(comment.authorThumbnails)?.url ?? '',
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              ) ,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => openChannel(context, comment.authorId),
                  child: Text(
                    comment.author,
                    style: TextStyle(color: colors.secondary),
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      visible: comment.creatorHeart != null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(color: colors.primaryContainer, borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Image(
                                    image: NetworkImage(
                                      comment.creatorHeart?.creatorThumbnail ?? '',
                                    ),
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                                Text(comment.creatorHeart?.creatorName ?? '')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(comment.content),
                Row(
                  children: [
                    Visibility(
                        visible: comment.likeCount > 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(Icons.thumb_up, size: 15, color: colors.secondary),
                        )),
                    Visibility(visible: comment.likeCount > 0, child: Text(comment.likeCount.toString())),
                    Expanded(
                        child: Text(
                      comment.publishedText,
                      textAlign: TextAlign.end,
                      style: TextStyle(color: colors.secondary),
                    )),
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
                                // locals.nReplies(comment.replies?.replyCount ?? 0).toString()),
                                locals.nReplies(comment.replies?.replyCount ?? 0),
                                style: const TextStyle(fontSize: 10),
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

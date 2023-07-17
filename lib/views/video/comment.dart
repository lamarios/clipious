import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/singleCommentController.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/views/channel.dart';
import 'package:invidious/views/components/videoThumbnail.dart';
import 'package:invidious/views/video/comments.dart';

import '../../main.dart';
import '../../models/comment.dart';
import '../../models/imageObject.dart';

class SingleCommentView extends StatelessWidget {
  final Comment comment;
  final String videoId;

  const SingleCommentView({super.key, required this.comment, required this.videoId});

  openChannel(BuildContext context, String authorId) {
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_CHANNEL, builder: (context) => ChannelView(channelId: authorId)));
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    return GetBuilder<SingleCommentController>(
      init: SingleCommentController(comment: comment),
      global: false,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => openChannel(context, _.comment.authorId),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Thumbnail(
                  width: 20,
                  height: 20,
                  id: 'comment-author-${_.comment.authorId}',
                  thumbnailUrl: ImageObject.getBestThumbnail(_.comment.authorThumbnails)?.url ?? '',
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => openChannel(context, _.comment.authorId),
                    child: Text(
                      _.comment.author,
                      style: TextStyle(color: colors.secondary),
                    ),
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: _.comment.creatorHeart != null,
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
                                        _.comment.creatorHeart?.creatorThumbnail ?? '',
                                      ),
                                      width: 15,
                                      height: 15,
                                    ),
                                  ),
                                  Text(_.comment.creatorHeart?.creatorName ?? '')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(_.comment.content),
                  Row(
                    children: [
                      Visibility(
                          visible: _.comment.likeCount > 0,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.thumb_up, size: 15, color: colors.secondary),
                          )),
                      Visibility(visible: _.comment.likeCount > 0, child: Text(_.comment.likeCount.toString())),
                      Expanded(
                          child: Text(
                        _.comment.publishedText,
                        textAlign: TextAlign.end,
                        style: TextStyle(color: colors.secondary),
                      )),
                    ],
                  ),
                  Visibility(
                      visible: _.comment.replies != null && !_.showingChildren,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SizedBox(
                            height: 15,
                            child: FilledButton.tonal(
                                onPressed: _.toggleShowChildren,
                                child: Text(
                                  // locals.nReplies(comment.replies?.replyCount ?? 0).toString()),
                                  locals.nReplies(_.comment.replies?.replyCount ?? 0),
                                  style: const TextStyle(fontSize: 10),
                                ))),
                      )),
                  Visibility(
                      visible: _.showingChildren,
                      child: CommentsView(
                        key: ValueKey('children-of-${_.comment.commentId}'),
                        videoId: videoId,
                        continuation: _.comment.replies?.continuation,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

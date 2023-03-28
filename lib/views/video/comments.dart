import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/commentsViewController.dart';
import 'package:invidious/views/video/comment.dart';

class CommentsView extends StatelessWidget {
  final String videoId;
  final String? continuation;
  final String? source;
  final String? sortBy;

  CommentsView({super.key, required this.videoId, this.continuation, this.source, this.sortBy});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return GetBuilder<CommentsViewController>(
        global: false,
        init: CommentsViewController(videoId: videoId, sortBy: sortBy, source: source, continuation: continuation),
        builder: (_) {
          List<Widget> widgets = [];

          widgets.addAll(_.comments.comments
              .map((c) => SingleCommentView(
                    videoId: videoId,
                    comment: c,
                  ))
              .toList(growable: true));

          if (_.continuation != null && !_.loadingComments) {
            widgets.add(
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: SizedBox(
                    height: 15,
                    child: FilledButton.tonal(
                        onPressed: _.loadMore,
                        child: Text(
                          locals.loadMore,
                          style: const TextStyle(fontSize: 10),
                        ))),
              ),
            );
          }

          if (_.loadingComments) {
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

          return _.error.isNotEmpty
              ? Text(_.error)
              : Column(
                  children: widgets,
                );
        });
  }
}

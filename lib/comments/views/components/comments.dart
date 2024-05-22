import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/comments/states/comments.dart';
import 'package:invidious/comments/views/components/comment.dart';

import '../../../videos/models/base_video.dart';

class CommentsView extends StatelessWidget {
  final BaseVideo video;
  final String? continuation;
  final String? source;
  final String? sortBy;

  const CommentsView(
      {super.key,
      required this.video,
      this.continuation,
      this.source,
      this.sortBy});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => CommentsCubit(CommentsState.init(
          video: video,
          sortBy: sortBy,
          source: source,
          continuation: continuation)),
      child:
          BlocBuilder<CommentsCubit, CommentsState>(builder: (context, state) {
        var cubit = context.read<CommentsCubit>();
        List<Widget> widgets = [];

        widgets.addAll(state.comments.comments
            .map((c) => SingleCommentView(
                  video: video,
                  comment: c,
                ))
            .toList(growable: true));

        if (state.continuation != null && !state.loadingComments) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: SizedBox(
                  height: 15,
                  child: FilledButton.tonal(
                      onPressed: cubit.loadMore,
                      child: Text(
                        locals.loadMore,
                        style:
                            TextStyle(fontSize: textTheme.labelSmall?.fontSize),
                      ))),
            ),
          );
        }

        if (state.loadingComments) {
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

        return state.error.isNotEmpty
            ? Text(state.error)
            : Column(
                children: widgets,
              );
      }),
    );
  }
}

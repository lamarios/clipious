import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/models/video.dart';

import 'comments.dart';

class CommentsContainer extends StatefulWidget {
  final Video video;

  const CommentsContainer({super.key, required this.video});

  @override
  State<CommentsContainer> createState() => _CommentsContainerState();
}

class _CommentsContainerState extends State<CommentsContainer> {
  String source = 'youtube';
  String sortBy = 'top';
  GlobalKey<CommentsViewState> key = GlobalKey(debugLabel: 'comments');

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                locals.comments,
                style: TextStyle(color: colorScheme.secondary, fontSize: 20),
              ),
            ),
            DropdownButton<String>(
              value: sortBy,
              onChanged: (String? value) {
                if (value != sortBy) {
                  setState(() {
                    sortBy = value ?? 'top';
                  });
                }
              },
              items:  [
                DropdownMenuItem(
                  value: 'top',
                  child: Text(locals.topSorting),
                ),
                DropdownMenuItem(
                  value: 'new',
                  child: Text(locals.newSorting),
                ),
              ],
            )
/*
              DropdownButton<String>(
                value: source,
                onChanged: (String? value) {
                  if (value != source) {
                    setState(() {
                      source = value ?? 'youtube';
                    });
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: 'youtube',
                    child: Text('Youtube'),
                  ),
                  DropdownMenuItem(
                    value: 'reddit',
                    child: Text('Reddit'),
                  ),
                ],
              )
*/
          ],
        ),
        CommentsView(key: key, videoId: widget.video.videoId, source: source, sortBy: sortBy),
      ],
    );
  }
}

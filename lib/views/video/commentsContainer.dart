import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/commentsContainerController.dart';
import 'package:invidious/models/video.dart';

import 'comments.dart';

class CommentsContainer extends StatelessWidget {
  final Video video;

  const CommentsContainer({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return GetBuilder<CommentsContainerController>(
      global: false,
      init: CommentsContainerController(),
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  locals.comments,
                  style: textTheme.titleMedium?.copyWith(color: colorScheme.secondary),
                ),
              ),
              DropdownButton<String>(
                value: _.sortBy,
                onChanged: _.changeSorting,
                items: [
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
          CommentsView(key: ValueKey<String>('comments-${_.sortBy}-${_.source}'), video: video, source: _.source, sortBy: _.sortBy),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/models/video.dart';
import 'package:invidious/views/videoList/singleVideo.dart';

import '../../models/videoInList.dart';

class RecommendedVideos extends StatelessWidget {
  final Video video;

  const RecommendedVideos({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;

    ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<Widget> widgets = [
      Text(
        locals.recommended,
        style: TextStyle(color: colorScheme.secondary, fontSize: 20),
      ),
    ];

    widgets.addAll(video.recommendedVideos.where((element) => !element.filterHide).map((e) {
      var v = VideoInList(e.title, e.videoId, e.lengthSeconds, 0, e.author, '', 'authorUrl', 0, '', e.videoThumbnails);
      v.filterHide = e.filterHide;
      v.filtered = e.filtered;
      v.matchedFilters = e.matchedFilters;
      return VideoListItem(video: v);
    }).toList());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}

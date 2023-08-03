import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/video.dart';
import '../../utils.dart';

class VideoMetrics extends StatelessWidget {
  final Video video;
  final int? dislikes;
  final TextStyle? style;
  final double iconSize;

  const VideoMetrics({super.key, required this.video, this.dislikes, this.style, this.iconSize = 20});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    return Row(children: [
      Icon(Icons.timer, size: iconSize),
      Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          prettyDuration(Duration(seconds: video.lengthSeconds ?? 0)),
          style: style,
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '•',
            style: style,
          )),
      Icon(Icons.visibility, size: iconSize),
      Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          compactCurrency.format(video.viewCount),
          style: style,
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '•',
            style: style,
          )),
      Icon(Icons.thumb_up, size: iconSize),
      Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          compactCurrency.format(video.likeCount),
          style: style,
        ),
      ),
      if (dislikes != null) ...[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '•',
              style: style,
            )),
        Icon(Icons.thumb_down, size: iconSize),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            compactCurrency.format(dislikes).replaceAll(".00", ""),
            style: style,
          ),
        ),
      ],
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '•',
            style: style,
          )),
      video.liveNow
          ? Visibility(
              visible: video.liveNow,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.podcasts,
                        size: iconSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          locals.streamIsLive,
                          style: style,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Text(
              video.publishedText ?? '',
              style: style,
            ),
    ]);
  }
}

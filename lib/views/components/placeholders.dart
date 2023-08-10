import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import '../../utils.dart';
import '../playlists/playlistThumbnail.dart';

class AnimatedPlaceHolder extends StatelessWidget {
  final Widget child;

  const AnimatedPlaceHolder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        child: Animate(autoPlay: true, onComplete: (controller) => controller.repeat(reverse: true), effects: const [FadeEffect(end: 0.3, begin: 0.6, duration: Duration(seconds: 2))], child: child));
  }
}

class TextPlaceHolder extends StatelessWidget {
  const TextPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 10,
      decoration: BoxDecoration(color: colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class ThumbnailPlaceHolder extends StatelessWidget {
  final double borderRadius;
  const ThumbnailPlaceHolder({super.key, this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class VideoListItemPlaceHolder extends StatelessWidget {
  const VideoListItemPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return AnimatedPlaceHolder(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const ThumbnailPlaceHolder(),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextPlaceHolder(),
                    SizedBox(
                      height: 4,
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: TextPlaceHolder(),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: TextPlaceHolder(),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          width: 20,
                          child: TextPlaceHolder(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.more_vert,
                  color: colorScheme.secondaryContainer,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CompactVideoPlaceHolder extends StatelessWidget {
  const CompactVideoPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return AnimatedPlaceHolder(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        height: 10,
                        decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<VideoListItemPlaceHolder> get videoPlaceholderList {
  var items = <VideoListItemPlaceHolder>[];

  for (int i = 0; i < 15; i++) {
    items.add(const VideoListItemPlaceHolder());
  }

  return items;
}

class VideoGridPlaceHolder extends StatelessWidget {
  final ScrollController scrollController;

  const VideoGridPlaceHolder({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        controller: scrollController,
        crossAxisCount: getGridCount(context),
        padding: const EdgeInsets.all(4),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: getGridAspectRatio(context),
        children: videoPlaceholderList);
  }
}

class PlaylistPlaceHolder extends StatelessWidget {
  const PlaylistPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimatedPlaceHolder(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 95,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: PlaylistThumbnails(videos: [], isPlaceHolder: true),
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FractionallySizedBox(widthFactor: 0.7, child: TextPlaceHolder()),
                  SizedBox(
                    height: 4,
                  ),
                  FractionallySizedBox(widthFactor: 0.4, child: TextPlaceHolder()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

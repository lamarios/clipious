import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:invidious/playlists/views/components/playlist_in_list.dart';

import '../../../playlists/views/components/playlist_thumbnail.dart';
import '../../../utils.dart';

class AnimatedPlaceHolder extends StatelessWidget {
  final Widget child;
  final bool animate;

  const AnimatedPlaceHolder(
      {super.key, required this.child, this.animate = true});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return animate
        ? FadeIn(
            child: Animate(
                autoPlay: true,
                onComplete: (controller) => controller.repeat(reverse: true),
                effects: const [
                  FadeEffect(
                      begin: 0.4, end: 0.8, duration: Duration(seconds: 2))
                ],
                child: child))
        : child;
  }
}

class TextPlaceHolder extends StatelessWidget {
  final bool small;

  const TextPlaceHolder({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: small ? 5 : 10,
      decoration: BoxDecoration(
          color: colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10)),
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
  final bool animate;
  final bool small;

  const VideoListItemPlaceHolder(
      {super.key, this.animate = true, this.small = false});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return AnimatedPlaceHolder(
      animate: animate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ThumbnailPlaceHolder(borderRadius: small ? 5 : 10),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextPlaceHolder(small: small),
                    const SizedBox(
                      height: 4,
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: TextPlaceHolder(
                        small: small,
                      ),
                    ),
                    if (!small)
                      const SizedBox(
                        height: 4,
                      ),
                    if (!small)
                      const Row(
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
              if (!small)
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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                      color: colors.secondaryContainer,
                      borderRadius: BorderRadius.circular(10)),
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
                        decoration: BoxDecoration(
                            color: colors.secondaryContainer,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                            color: colors.secondaryContainer,
                            borderRadius: BorderRadius.circular(10)),
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

List<VideoListItemPlaceHolder> videoPlaceholderList({int count = 5}) {
  return repeatWidget(() => const VideoListItemPlaceHolder());
}

List<T> repeatWidget<T extends Widget>(T Function() child, {int count = 5}) {
  var items = <T>[];

  for (int i = 0; i < count; i++) {
    items.add(child());
  }

  return items;
}

class VideoGridPlaceHolder extends StatelessWidget {
  final ScrollController scrollController;

  const VideoGridPlaceHolder({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    var gridCount = getGridCount(context);
    return GridView.count(
        controller: scrollController,
        crossAxisCount: gridCount,
        padding: const EdgeInsets.all(4),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: getGridAspectRatio(context),
        children: videoPlaceholderList(count: gridCount * 5));
  }
}

class PlaylistPlaceHolder extends StatelessWidget {
  final bool small;

  const PlaylistPlaceHolder({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedPlaceHolder(
      child: small
          ? const AspectRatio(
              aspectRatio: smallPlaylistAspectRatio,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      child:
                          PlaylistThumbnails(videos: [], isPlaceHolder: true)),
                  FractionallySizedBox(
                      widthFactor: 0.7,
                      child: TextPlaceHolder(
                        small: true,
                      )),
                ],
              ),
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 95,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          PlaylistThumbnails(videos: [], isPlaceHolder: true),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FractionallySizedBox(
                          widthFactor: 0.7, child: TextPlaceHolder()),
                      SizedBox(
                        height: 4,
                      ),
                      FractionallySizedBox(
                          widthFactor: 0.4, child: TextPlaceHolder()),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

class TvVideoItemPlaceHolder extends StatelessWidget {
  const TvVideoItemPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedPlaceHolder(
          child: Transform.scale(
        scale: 0.9,
        child: const AspectRatio(
          aspectRatio: 16 / 13,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ThumbnailPlaceHolder(),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: TextPlaceHolder(),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: FractionallySizedBox(
                  widthFactor: 0.4,
                  child: TextPlaceHolder(),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class TvPlaylistPlaceHolder extends StatelessWidget {
  const TvPlaylistPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPlaceHolder(
        child: AspectRatio(
      aspectRatio: 16 / 13,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 140,
                      child: PlaylistThumbnails(
                        videos: [],
                        isPlaceHolder: true,
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  FractionallySizedBox(
                      widthFactor: 0.7,
                      child: SizedBox(height: 20, child: TextPlaceHolder())),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: FractionallySizedBox(
                          widthFactor: 0.4, child: TextPlaceHolder())),
                ],
              ),
            ),
          )),
    ));
  }
}

class ParagraphPlaceHolder extends StatelessWidget {
  const ParagraphPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: repeatWidget(
          () => SizedBox(
              width: Random().nextInt(100) + 50,
              child: const TextPlaceHolder()),
          count: Random().nextInt(30) + 10),
    );
  }
}

class TvChannelPlaceholder extends StatelessWidget {
  const TvChannelPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return AnimatedPlaceHolder(
        child: Container(
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text('               '),
    ));
  }
}

class VideoPlaceHolder extends StatelessWidget {
  const VideoPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return AnimatedPlaceHolder(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ThumbnailPlaceHolder(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                height: 25,
                child: Checkbox(
                  visualDensity: VisualDensity.compact,
                  value: false,
                  onChanged: (value) {},
                )),
            const SizedBox(width: 140, child: TextPlaceHolder())
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20, child: TextPlaceHolder()),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: repeatWidget(
                        () => const SizedBox(
                            height: 15, width: 50, child: TextPlaceHolder()),
                        count: 3),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: colors.secondaryContainer,
                              shape: BoxShape.circle),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(width: 150, child: TextPlaceHolder()),
                      ),
                    ],
                  ),
                  // subscribe button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: 120,
                      height: 25,
                      decoration: BoxDecoration(
                          color: colors.secondaryContainer,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  ...repeatWidget(() => const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: ParagraphPlaceHolder(),
                      )),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: repeatWidget(
                            () => Container(
                                  width: Random().nextInt(100) + 50,
                                  decoration: BoxDecoration(
                                      color: colors.secondaryContainer,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Text(''),
                                  ),
                                ),
                            count: 15)),
                  )
                ],
              ),
            ),
          ),
        )),
      ],
    ));
  }
}

class ChannelPlaceHolder extends StatelessWidget {
  const ChannelPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: AnimatedPlaceHolder(
          child: Stack(alignment: Alignment.topCenter, children: [
        Container(
          padding: const EdgeInsets.only(top: 200, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: const SizedBox(
                  width: 250,
                  height: 25,
                  child: TextPlaceHolder(),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              // subscribe button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 120,
                  height: 25,
                  decoration: BoxDecoration(
                      color: colors.secondaryContainer,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              ...repeatWidget(
                  () => const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: ParagraphPlaceHolder(),
                      ),
                  count: 3),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: 200,
                  height: 20,
                  child: TextPlaceHolder(),
                ),
              ),
              ...repeatWidget(
                  () => const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: VideoListItemPlaceHolder(animate: false),
                      ),
                  count: 5)
            ],
          ),
        ),
      ])),
    );
  }
}

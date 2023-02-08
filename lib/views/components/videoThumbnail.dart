import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/videoInList.dart';

class VideoThumbnailView extends StatelessWidget {
  final String videoId;
  final String thumbnailUrl;
  Widget? child;

  VideoThumbnailView({super.key, required this.videoId, required this.thumbnailUrl, this.child});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Thumbnail(id: 'v/${videoId}', thumbnailUrl: thumbnailUrl, decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)), child: child),
    );
  }
}

class Thumbnail extends StatelessWidget {
  final String id;
  final Widget? child;
  double? height;
  double? width;

  final String thumbnailUrl;
  final BoxDecoration decoration;

  Thumbnail({super.key, required this.id, this.child, required this.thumbnailUrl, required this.decoration, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return CachedNetworkImage(
      cacheKey: id,
      imageBuilder: (context, imageProvider) => AnimatedContainer(
        curve: Curves.easeInOutQuad,
        height: height,
        width: width,
        decoration: decoration.copyWith(image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        duration: animationDuration,
        child: child,
      ),
      imageUrl: thumbnailUrl,
      placeholderFadeInDuration: animationDuration,
      fadeInDuration: animationDuration,
      fadeOutDuration: animationDuration,
      progressIndicatorBuilder: (context, url, progress) => AnimatedContainer(
        curve: Curves.easeInOutQuad,
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
        duration: animationDuration,
        child: child ??
            const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                )),
      ),
    );
  }
}

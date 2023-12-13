import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';

class OfflineVideoThumbnail extends StatelessWidget {
  final DownloadedVideo video;
  final double borderRadius;

  const OfflineVideoThumbnail({super.key, required this.video, this.borderRadius = 10});

  Future<String?> getThumbnail() async {
    var tries = 0;
    while (tries < 20) {
      tries++;
      var expectedPath = await video.thumbnailPath;
      var exists = await File(expectedPath).exists();
      if (exists) {
        return expectedPath;
      } else {
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return FutureBuilder<String?>(
        future: getThumbnail(),
        builder: (context, snapshot) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: snapshot.data != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: Image.file(
                      File(snapshot.data!),
                      fit: BoxFit.contain,
                    ))
                : Container(
                    decoration: BoxDecoration(
                        color: colors.secondaryContainer, borderRadius: BorderRadius.circular(borderRadius)),
                  ),
          );
        });
  }
}

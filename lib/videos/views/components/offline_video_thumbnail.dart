import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';

class OfflineVideoThumbnail extends StatelessWidget {
  final DownloadedVideo video;
  final double borderRadius;

  const OfflineVideoThumbnail(
      {super.key, required this.video, this.borderRadius = 10});

  Future<Uint8List?> getThumbnail() async {
    var tries = 0;
    while (tries < 20) {
      tries++;
      var exists = await video.thumbExists;
      if (exists) {
        return await video.thumbBytes;
      } else {
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return FutureBuilder<Uint8List?>(
        future: getThumbnail(),
        builder: (context, snapshot) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: snapshot.data != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: Image.memory(
                      snapshot.data!,
                      fit: BoxFit.contain,
                    ))
                : Container(
                    decoration: BoxDecoration(
                        color: colors.secondaryContainer,
                        borderRadius: BorderRadius.circular(borderRadius)),
                  ),
          );
        });
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:invidious/controllers/offlineVideoThumbnailController.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

class OfflineVideoThumbnail extends StatelessWidget {
  final DownloadedVideo video;

  const OfflineVideoThumbnail({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return GetBuilder<OfflineVideoThumbnailController>(
        init: OfflineVideoThumbnailController(video),
        global: false,
        builder: (_) {
          print('REPAAAIINT) ${video.videoId} / ${_.path} / ${_.video.videoId}');
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: _.path != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(_.path!),
                      fit: BoxFit.contain,
                    ))
                : Container(
                    decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                  ),
          );
        });
  }
}

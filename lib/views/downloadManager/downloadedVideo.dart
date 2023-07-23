import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:invidious/controllers/downloadedVideoController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

class DownloadedVideoView extends StatelessWidget {
  final DownloadedVideo video;

  const DownloadedVideoView({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return GetBuilder<DownloadedVideoController>(
        tag: video.id.toString(),
        init: DownloadedVideoController(video),
        builder: (_) {
          return SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: AnimatedSwitcher(
                        duration: animationDuration,
                        child: _.thumbnailPath != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(_.thumbnailPath!),
                                  fit: BoxFit.contain,
                                ))
                            : Container(
                                decoration: BoxDecoration(color: colors.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                              )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _.video.title,
                            style: TextStyle(color: colors.primary, overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            _.video.author ?? '',
                            style: TextStyle(color: colors.secondary, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _.video.downloadComplete
                        ? IconButton.filledTonal(
                            onPressed: _.playVideo,
                            icon: const Icon(Icons.play_arrow),
                          )
                        : SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              value: _.progress,
                            ),
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

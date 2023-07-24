import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:invidious/controllers/downloadedVideoController.dart';
import 'package:invidious/models/db/downloadedVideo.dart';

import '../components/compactVideo.dart';

class DownloadedVideoView extends StatelessWidget {
  final DownloadedVideo video;

  const DownloadedVideoView({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return GetBuilder<DownloadedVideoController>(
        global: false,
        init: DownloadedVideoController(video.id),
        builder: (_) {
          return _.video != null
              ? CompactVideo(
                  offlineVideo: _.video,
                  onTap: _.playVideo,
                  trailing: [
                    (_.video?.downloadComplete ?? false)
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              value: _.progress == 0 ? null : _.progress,
                            ),
                          )
                  ],
                )
              : const Icon(Icons.clear);
        });
  }
}

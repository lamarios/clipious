import 'package:flutter/material.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/models/db/downloadedVideo.dart';
import 'package:invidious/views/videoPlayer/miniPlayerControls.dart';
import 'package:invidious/views/videoPlayer/miniPlayerProgress.dart';

import '../../models/video.dart';

class MiniPlayerView {
  @override
  static List<Widget> build(BuildContext context, MiniPlayerController controller) {
    ColorScheme colors = Theme.of(context).colorScheme;
    Video? vid = controller.currentlyPlaying;
    DownloadedVideo? offlineVid = controller.offlineCurrentlyPlaying;

    String title = vid?.title ?? offlineVid?.title ?? '';
    String author = vid?.author ?? offlineVid?.author ?? '';
    String videoId = vid?.videoId ?? offlineVid?.videoId ?? '';

    return ((vid != null && controller.videos.isNotEmpty) || (offlineVid != null && controller.offlineVideos.isNotEmpty)) && controller.isMini
        ? [
            Expanded(
                flex: 2,
                child: Visibility(
                  visible: controller.isMini,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(builder: (context) {
                      return Column(
                        children: [
                          Text(
                            '$title - $author',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 11),
                          ),
                          MiniPlayerControls(
                            videoId: videoId,
                            controller: controller,
                          ),
                          const MiniPlayerProgress(),
                        ],
                      );
                    }),
                  ),
                )),
            Visibility(
              visible: controller.isMini,
              child: GestureDetector(
                onTap: controller.hide,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.clear),
                ),
              ),
            )
          ]
        : [];
  }
}

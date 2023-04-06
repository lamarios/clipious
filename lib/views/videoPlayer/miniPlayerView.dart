import 'package:flutter/material.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/views/videoPlayer/miniPlayerControls.dart';
import 'package:invidious/views/videoPlayer/miniPlayerProgress.dart';

import '../../models/video.dart';

class MiniPlayerView {
  @override
  static List<Widget> build(BuildContext context, MiniPlayerController controller) {
    ColorScheme colors = Theme.of(context).colorScheme;
    Video? vid = controller.currentlyPlaying;
    return vid != null && controller.videos.isNotEmpty && controller.isMini
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
                          Text('${vid.title} - ${vid.author}', overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11),),
                          MiniPlayerControls(
                            videoId: vid.videoId,
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

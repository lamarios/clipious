import 'package:flutter/material.dart';
import 'package:invidious/controllers/miniPayerController.dart';

import '../../models/video.dart';
import '../video/player.dart';

class MiniPlayerView {
  @override
  static List<Widget> build(BuildContext context, MiniPlayerController controller) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return controller.videos.isNotEmpty
        ? [
            Expanded(
                child: Visibility(
              visible: controller.isMini,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(builder: (context) {
                  Video vid = controller.videos[controller.currentIndex];

                  return GestureDetector(
                    onTap: controller.showVideo,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          vid.title,
                        ),
                        Text(
                          vid.author,
                        ),
                      ],
                    ),
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

import 'package:flutter/material.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/views/videoPlayer/miniPlayerControls.dart';

import '../../models/video.dart';

class MiniPlayerView {
  @override
  static List<Widget> build(BuildContext context, MiniPlayerController controller) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return controller.videos.isNotEmpty && controller.isMini
        ? [
            Expanded(
                flex: 2,
                child: Visibility(
                  visible: controller.isMini,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(builder: (context) {
                      Video vid = controller.videos[controller.currentIndex];

                      return Column(
                        children: [
                          Text('${vid.title} - ${vid.author}', overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11),),
                          MiniPlayerControls(
                            controller: controller,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 2,
                              decoration: BoxDecoration(
                                color: colors.secondaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: AnimatedFractionallySizedBox(
                                  widthFactor: controller.progress,
                                  heightFactor: 1,
                                  duration: const Duration(milliseconds: 750),
                                  curve: Curves.easeInOutQuad,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colors.primary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ))),
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

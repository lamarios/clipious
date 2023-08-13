import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:invidious/controllers/miniplayerControlsController.dart';
import 'package:invidious/utils.dart';

import '../../controllers/miniPayerController.dart';

const ButtonStyle buttonStyle = ButtonStyle(visualDensity: VisualDensity.compact);

class MiniPlayerControls extends StatelessWidget {
  final MiniPlayerController controller;
  final String videoId;

  const MiniPlayerControls({Key? key, required this.controller, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    bool enablePrevNext = controller.hasQueue;

    var isMini = controller.isMini;
    return Padding(
      padding: isMini ? EdgeInsets.zero : const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: isMini ? colors.secondaryContainer : colors.background),
        constraints: BoxConstraints(
          maxWidth: tabletMaxVideoWidth,
        ),
        child: GetBuilder<MiniPlayerControlsController>(
          // global: false,
          init: MiniPlayerControlsController(videoId),
          builder: (_) => Stack(
            alignment: Alignment.center,
            children: [
              // Positioned(left: 0, child: VideoLikeButton(videoId: videoId, style: buttonStyle)),
              if (isMini)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: enablePrevNext,
                      child: IconButton(
                          style: buttonStyle,
                          onPressed: _.playPrevious,
                          icon: const Icon(
                            Icons.skip_previous,
                          )),
                    ),
                    IconButton(
                        onPressed: _.rewind,
                        style: buttonStyle,
                        icon: const Icon(
                          Icons.fast_rewind,
                        )),
                    IconButton(
                        onPressed: _.togglePlay,
                        style: buttonStyle,
                        icon: Icon(
                          _.isPlaying() ? Icons.pause : Icons.play_arrow,
                        )),
                    IconButton(
                        onPressed: _.fastForward,
                        style: buttonStyle,
                        icon: const Icon(
                          Icons.fast_forward,
                        )),
                    Visibility(
                      visible: enablePrevNext,
                      child: IconButton(
                          onPressed: _.playNext,
                          style: buttonStyle,
                          icon: const Icon(
                            Icons.skip_next,
                          )),
                    )
                  ],
                ),
              if (!isMini)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        style: buttonStyle,
                        onPressed: _.switchToNextRepeat,
                        color: controller.repeat == PlayerRepeat.noRepeat ? null : colors.primary,
                        icon: Icon(
                          controller.repeat == PlayerRepeat.repeatOne ? Icons.repeat_one : Icons.repeat,
                        )),
                    if(controller.hasQueue)IconButton(
                      onPressed: _.toggleShuffle,
                      style: buttonStyle,
                      icon: const Icon(Icons.shuffle),
                      color: controller.shuffle ? colors.primary : null,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

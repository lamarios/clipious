import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:invidious/controllers/miniplayerControlsController.dart';
import 'package:invidious/views/components/videoLikeButton.dart';

import '../../controllers/miniPayerController.dart';

const double buttonSize = 25;
const ButtonStyle buttonStyle = ButtonStyle(visualDensity: VisualDensity.compact);

class MiniPlayerControls extends StatelessWidget {
  final MiniPlayerController controller;

  const MiniPlayerControls({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MiniPlayerControlsController>(
      global: false,
      init: MiniPlayerControlsController(),
      builder: (_) => Stack(
        alignment: Alignment.center,
        children: [
          Positioned(left: 0, child: VideoLikeButton(videoId: controller.currentVideo.videoId, size: 15, style: buttonStyle)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: buttonSize,
                  style: buttonStyle,
                  onPressed: controller.videos.length > 1 ? _.playPrevious : null,
                  icon: const Icon(
                    Icons.skip_previous,
                  )),
              IconButton(
                  iconSize: buttonSize,
                  onPressed: _.togglePlay,
                  style: buttonStyle,
                  icon: Icon(
                    _.isPlaying() ? Icons.pause : Icons.play_arrow,
                  )),
              IconButton(
                  iconSize: buttonSize,
                  onPressed: controller.videos.length > 1 ? _.playNext : null,
                  style: buttonStyle,
                  icon: const Icon(
                    Icons.skip_next,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

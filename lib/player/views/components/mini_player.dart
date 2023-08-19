import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/downloads/models/downloaded_video.dart';
import 'package:invidious/player/views/components/mini_player_controls.dart';
import 'package:invidious/player/views/components/mini_player_progress.dart';

import '../../../videos/models/video.dart';

class MiniPlayer {
  static List<Widget> build(BuildContext context) {
    var player = context.read<PlayerCubit>();
    var controller = player.state;

    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
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
                    padding: const EdgeInsets.all(4.0),
                    child: Builder(builder: (context) {
                      return Column(
                        children: [
                          Text(
                            '$title - $author',
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodySmall,
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
                onTap: player.hide,
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

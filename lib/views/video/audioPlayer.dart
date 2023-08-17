import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/objectbox.g.dart';
import 'package:invidious/videos/views/components/offline_video_thumbnail.dart';
import 'package:invidious/views/videoPlayer/playerControls.dart';

import '../../controllers/audioPlayerController.dart';
import '../../downloads/models/downloaded_video.dart';
import '../../videos/models/video.dart';
import '../../utils.dart';
import '../../videos/views/components/video_thumbnail.dart';

class AudioPlayer extends StatelessWidget {
  final Video? video;
  final DownloadedVideo? offlineVideo;
  final bool miniPlayer;

  const AudioPlayer({super.key, this.video, required this.miniPlayer, this.offlineVideo}) : assert(video == null || offlineVideo == null, 'cannot provide both video and offline video\n');

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    AppLocalizations locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;

    return GetBuilder<AudioPlayerController>(
      init: AudioPlayerController(offlineVideo: offlineVideo, video: video),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(miniPlayer ? 8 : 0.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                _.video != null
                    ? VideoThumbnailView(
                        decoration: const BoxDecoration(),
                        videoId: _.video!.videoId,
                        thumbnailUrl: _.video?.getBestThumbnail()?.url ?? '',
                      )
                    : _.offlineVideo != null
                        ? OfflineVideoThumbnail(borderRadius: 0, key: ValueKey(_.offlineVideo?.videoId ?? ''), video: _.offlineVideo!)
                        : const SizedBox.shrink(),
                const PlayerControls()
              ],
            ),
          ),
        );
      },
    );
  }
}
